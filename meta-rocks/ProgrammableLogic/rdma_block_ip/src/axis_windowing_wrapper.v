//------------------------------------------------------------------------------
// File: axis_windowing_wrapper.v
// Description: Xilinx-Compatible Verilog Wrapper for AXI-Stream Windowing Block
//
// This wrapper provides a Xilinx-friendly interface with proper X_INTERFACE_INFO
// attributes for AXI-Stream interfaces. It instantiates the axis_windowing module
// and adds pulse stretching for interrupt and status signals.
//
// Features:
//   - Pass-through AXI-Stream (no buffering)
//   - Asynchronous interrupt input with CDC synchronization
//   - Pulse-stretched status outputs for visibility
//   - Xilinx interface descriptors for IP Integrator
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module axis_windowing_wrapper #(
  parameter DATA_WIDTH_BITS  = 64,
  parameter WINDOW_SIZE      = 2048,     // Number of cycles to capture
  parameter DELAY_CYCLES     = 128,      // Cycles to wait after interrupt
  parameter USE_XPM_CDC      = 1       // Use Xilinx XPM CDC (1=synthesis, 0=sim)
) (
  // Clock and reset
  input  wire                        aclk,
  input  wire                        aresetn,

  // Interrupt input (asynchronous)
  input  wire                        irq_async_i,

  // AXI-Stream Slave Interface (Input)
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
  // (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *)
  input  wire                        s_axis_tvalid_i,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA"  *)
  input  wire [DATA_WIDTH_BITS-1:0]  s_axis_tdata_i,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TUSER"  *)
  input wire [3:0] s_axis_tuser_i, // AXI user signal for multi-frame start indication

  // AXI-Stream Master Interface (Output)
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
  // (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *)
  output wire                        m_axis_tvalid_o,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA"  *)
  output wire [DATA_WIDTH_BITS-1:0]  m_axis_tdata_o,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST"  *)
  output wire                        m_axis_tlast_o,

  // Status outputs (pulse-stretched)
  output wire                        window_active_o,
  output wire                        window_complete_o,
  output wire                        irq_received_o,
  output wire [1:0]			     state_o
);

  // -------------------------
  // Internal signals
  // -------------------------
  wire window_active_int;
  wire window_complete_int;
  wire irq_sync_i;

  // Active-low to active-high reset conversion
  wire rst_ni;
  assign rst_ni = aresetn;

  // -------------------------
  // Core: axis_windowing
  // -------------------------
  axis_windowing #(
    .DataWidth   (DATA_WIDTH_BITS),
    .WindowSize  (WINDOW_SIZE),
    .DelayCycles (DELAY_CYCLES)
  ) u_axis_windowing (
    .clk_i               (aclk),
    .rst_ni              (rst_ni),
    .irq_sync_i         (irq_sync_i),
    .s_axis_tvalid_i     (s_axis_tvalid_i),
    .s_axis_tdata_i      (s_axis_tdata_i),
    .m_axis_tvalid_o     (m_axis_tvalid_o),
    .m_axis_tdata_o      (m_axis_tdata_o),
    .m_axis_tlast_o      (m_axis_tlast_o),
    .window_active_o     (window_active_int),
    .window_complete_o   (window_complete_int),
    .state_o		(state_o),
    .start_of_multiframe_i(s_axis_tuser_i[0]) // Use TUSER[0] as start of multiframe indicator
  );

  // -------------------------
  // Extract synchronized interrupt for status
  // -------------------------
  generate
    if (USE_XPM_CDC) begin : gen_xpm_irq_status
      // Use XPM CDC to synchronize interrupt for status output
      xpm_cdc_single #(
        .DEST_SYNC_FF   (2),
        .INIT_SYNC_FF   (0),
        .SIM_ASSERT_CHK (1),
        .SRC_INPUT_REG  (0)
      ) u_irq_status_sync (
        .src_clk  (1'b0),
        .src_in   (irq_async_i),
        .dest_clk (aclk),
        .dest_out (irq_sync_i)
      );
    end else begin : gen_simple_irq_status
      // Direct assignment for simulation
      assign irq_sync_i = irq_async_i;
    end
  endgenerate

  // -------------------------
  // Optional pulse stretching for status signals
  // -------------------------
  pulse_stretcher #(.STRETCH_CYCLES(16)) u_ps_active (
    .clk       (aclk),
    .rst_ni    (rst_ni),
    .signal_in (window_active_int),
    .signal_out(window_active_o)
  );

  pulse_stretcher #(.STRETCH_CYCLES(16)) u_ps_complete (
    .clk       (aclk),
    .rst_ni    (rst_ni),
    .signal_in (window_complete_int),
    .signal_out(window_complete_o)
  );

  pulse_stretcher #(.STRETCH_CYCLES(16)) u_ps_irq (
    .clk       (aclk),
    .rst_ni    (rst_ni),
    .signal_in (irq_sync_i),
    .signal_out(irq_received_o)
  );

endmodule
