// AXI-Stream Windowing Block
//
// This module forwards AXI-Stream data from input to output for a predefined
// number of cycles after an interrupt signal is asserted. The stream is not
// buffered - data passes through combinatorially when the window is active.
//
// Operation:
// 1. Wait for interrupt trigger
// 2. Wait for DelayCycles after interrupt
// 3. Forward exactly WindowSize cycles of data
// 4. Return to idle
//
// Assumptions:
// - Input data (s_axis_tdata_i) is always valid and stable during capture
// - No backpressure support needed

module axis_windowing #(
  parameter int unsigned DataWidth   = 64,
  parameter int unsigned WindowSize  = 2048,  // Number of cycles to capture
  parameter int unsigned DelayCycles = 128     // Cycles to wait after interrupt before capture
) (
  // Clock and reset
  input  logic                  clk_i,
  input  logic                  rst_ni,

  // Interrupt input (asynchronous)
  input  logic                  irq_sync_i,

  // AXI-Stream slave interface (no backpressure)
  input  logic                  s_axis_tvalid_i,
  input  logic [DataWidth-1:0]  s_axis_tdata_i,

  // AXI-Stream master interface
  output logic                  m_axis_tvalid_o,
  output logic [DataWidth-1:0]  m_axis_tdata_o,
  output logic                  m_axis_tlast_o,

  // Status outputs
  output logic                  window_active_o,
  output logic                  window_complete_o,
  output logic [1:0]			state_o,

  input logic                 start_of_multiframe_i
);

  // Signal declarations
  localparam int unsigned MaxCount = (WindowSize > DelayCycles) ? WindowSize : DelayCycles;
  localparam int unsigned CounterWidth = $clog2(MaxCount + 1);
  
  // Comparison values (sized to match counter width)
  localparam logic [CounterWidth-1:0] DelayCyclesEnd = DelayCycles - 1;
  localparam logic [CounterWidth-1:0] WindowSizeEnd = WindowSize - 1;



  // State encoding
  typedef enum logic [1:0] {
    StIdle      = 2'b00,
    StWait      = 2'b01,
    StDelay     = 2'b10,
    StCapture   = 2'b11
  } state_e;

  state_e state_q, state_d;

  logic [CounterWidth-1:0] cycle_counter_q, cycle_counter_d;
  logic irq_sync_q, irq_sync_d;


  assign irq_sync_d = irq_sync_i;



  // State machine and counter logic
  always_comb begin
    // Default assignments
    state_d = state_q;
    cycle_counter_d = cycle_counter_q;

    case (state_q)
      StIdle: begin
        cycle_counter_d = '0;
        if (~irq_sync_q & irq_sync_d) begin // edge detection
          // Interrupt received, decide next state based on delay setting
          if (DelayCycles == 0) begin
            state_d = StCapture;  // No delay, start capturing immediately
          end else begin
            state_d = StWait;    // Wait for delay cycles first
          end
        end
      end

      StWait: begin
        // Wait for start_of_multiframe signal
        if (start_of_multiframe_i) begin
          state_d = StDelay;
          cycle_counter_d = '1; //the current cycle is treated as cycle 0
        end
      end

      StDelay: begin
        // Count delay cycles
        cycle_counter_d = cycle_counter_q + 1'b1;
        
        if (cycle_counter_q == DelayCyclesEnd) begin
          // Delay complete, start capturing
          state_d = StCapture;
          cycle_counter_d = '0;
        end
      end

      StCapture: begin
        // Count capture cycles
        cycle_counter_d = cycle_counter_q + 1'b1;
        
        if (cycle_counter_q == WindowSizeEnd) begin
          // Capture complete, return to idle
          state_d = StIdle;
          cycle_counter_d = '0;
        end
      end

      default: begin
        state_d = StIdle;
        cycle_counter_d = '0;
      end
    endcase
  end



  // State register
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state_q <= StIdle;
      cycle_counter_q <= '0;
      irq_sync_q <= 1'b0;
    end else begin
      state_q <= state_d;
      cycle_counter_q <= cycle_counter_d;
      irq_sync_q <= irq_sync_d;
    end
  end

  // Output assignments
  // Forward data only when in capture state
  assign m_axis_tvalid_o = (state_q == StCapture);
  assign m_axis_tdata_o  = s_axis_tdata_i;
  assign state_o = state_q;
  assign m_axis_tlast_o  = (state_q == StCapture) & (state_d == StIdle);

  // Status outputs
  assign window_active_o   = (state_q == StCapture);
  assign window_complete_o = (state_q == StIdle);



endmodule
