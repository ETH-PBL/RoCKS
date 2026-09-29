`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2026 11:10:57 AM
// Design Name: 
// Module Name: BRAM_buffer_wrapper
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

module BRAM_buffer_wrapper(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis_ddr:s_req_ddr_wr:s_req_ddr_rd:m_axis_ddr, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk, 

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,
                                
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TVALID" *)
input wire s_axis_ddr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TDATA" *)
input wire [511:0] s_axis_ddr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TREADY" *)
output wire s_axis_ddr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TLAST" *)
input wire s_axis_ddr_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TKEEP" *)
input wire [63:0] s_axis_ddr_tkeep,

                                 
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TVALID" *)
output wire m_axis_ddr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TDATA" *)
output wire [511:0] m_axis_ddr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TREADY" *)
input wire m_axis_ddr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TLAST" *)
output wire m_axis_ddr_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TKEEP" *)
output wire [63:0] m_axis_ddr_tkeep,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TVALID" *)
input wire s_req_ddr_wr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TDATA" *)
input wire [95:0] s_req_ddr_wr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TREADY" *)
output wire s_req_ddr_wr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TVALID" *)
input wire s_req_ddr_rd_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TDATA" *)
input wire[95:0] s_req_ddr_rd_tdata,

(*X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TREADY" *)
output wire s_req_ddr_rd_tready,

output wire [6:0] counter_dbg,

input wire [15:0] packet_length


    );
    
    BRAM_buffer BRAM_buffer_inst(
    .nclk(nclk), 
    .nresetn(nresetn), 
    
    .s_axis_ddr_tvalid(s_axis_ddr_tvalid), 
    .s_axis_ddr_tdata(s_axis_ddr_tdata),
    .s_axis_ddr_tready(s_axis_ddr_tready), 
    .s_axis_ddr_tlast(s_axis_ddr_tlast), 
    .s_axis_ddr_tkeep(s_axis_ddr_tkeep), 
    
    .m_axis_ddr_tvalid(m_axis_ddr_tvalid),
    .m_axis_ddr_tdata(m_axis_ddr_tdata), 
    .m_axis_ddr_tready(m_axis_ddr_tready), 
    .m_axis_ddr_tlast(m_axis_ddr_tlast), 
    .m_axis_ddr_tkeep(m_axis_ddr_tkeep),
    
    .s_req_ddr_wr_tvalid(s_req_ddr_wr_tvalid),
    .s_req_ddr_wr_tdata(s_req_ddr_wr_tdata),
    .s_req_ddr_wr_tready(s_req_ddr_wr_tready),
    
    .s_req_ddr_rd_tvalid(s_req_ddr_rd_tvalid),
    .s_req_ddr_rd_tdata(s_req_ddr_rd_tdata),
    .s_req_ddr_rd_tready(s_req_ddr_rd_tready),
    
    .counter_dbg(counter_dbg),
    .packet_length(packet_length)
    );
     
endmodule
