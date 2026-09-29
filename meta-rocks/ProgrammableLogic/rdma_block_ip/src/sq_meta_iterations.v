`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 02:20:46 PM
// Design Name: 
// Module Name: sq_meta_iterations
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sq_meta_iterations (
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis_sq_meta:m_axis_sq_meta, FREQ_HZ 100000000" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
    input wire nclk, 

    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
    input wire nresetn,

    // S AXIS
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TVALID" *)
    input wire s_axis_sq_meta_tvalid,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TDATA" *)
    input wire [247:0] s_axis_sq_meta_tdata,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TREADY" *)
    output wire s_axis_sq_meta_tready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TLAST" *)
    input wire s_axis_sq_meta_tlast,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TKEEP" *)
    input wire [30:0] s_axis_sq_meta_tkeep,

    //M AXIS
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TVALID" *)
    output wire m_axis_sq_meta_tvalid,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TDATA" *)
    output reg [247:0] m_axis_sq_meta_tdata,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TREADY" *)
    input wire m_axis_sq_meta_tready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TLAST" *)
    output wire m_axis_sq_meta_tlast,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TKEEP" *)
    output wire [30:0] m_axis_sq_meta_tkeep,

    input wire[31:0] iterations
);

    reg [31:0] counter;
    reg [1:0] state;
    reg [31:0] cur_iterations;
    localparam IDLE = 0, RUN = 1, END_OF_TRANSFER = 2;
    always @(posedge nclk) begin
        if(!nresetn) begin
            counter <= 0;
            m_axis_sq_meta_tdata <= 0;
            cur_iterations <= 0;
            state <= IDLE;
        end else begin
            case(state)
                RUN: begin
                    if(m_axis_sq_meta_tready) begin
                        m_axis_sq_meta_tdata[119:56] <= m_axis_sq_meta_tdata[119:56] + m_axis_sq_meta_tdata[215:184];
                        counter <= counter + 1;
                        if(counter == (cur_iterations - 1)) begin
                            // send last packet as RMDA SEND to signal end of data transfer
                            m_axis_sq_meta_tdata[31:0] <= 32'h00000004; // SEND Only
                            state <= END_OF_TRANSFER;
                        end
                    end
                end
                END_OF_TRANSFER: begin
                    if(m_axis_sq_meta_tready) begin
                        state <= IDLE;
                    end
                end
                IDLE: begin
                    counter <= 0;
                    if(s_axis_sq_meta_tvalid & s_axis_sq_meta_tready) begin
                        state <= RUN;
                        m_axis_sq_meta_tdata <= s_axis_sq_meta_tdata;
                        cur_iterations <= iterations;
                    end
                end
            endcase
        end
    end
    
    assign s_axis_sq_meta_tready = 1'b1;
    assign m_axis_sq_meta_tkeep = {31{1'b1}};
    assign m_axis_sq_meta_tlast = 1'b1;
    assign m_axis_sq_meta_tvalid = ((state == RUN) || (state == END_OF_TRANSFER));
endmodule
