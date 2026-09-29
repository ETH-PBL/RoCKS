`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2026 10:55:39 AM
// Design Name: 
// Module Name: ack_gap_enforcer_wrapper
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


module ack_gap_enforcer_wrapper(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis:m_axis, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk,

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire[511:0] s_axis_tdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
input wire s_axis_tlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
input wire [63:0] s_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
output wire m_axis_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
output wire[511:0] m_axis_tdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
output wire m_axis_tlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
output wire [63:0] m_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
input wire m_axis_tready
    );
    
    ack_gap_enforcer ack_gap_enforcer_inst(.nclk(nclk), .nresetn(nresetn), .s_axis_tvalid(s_axis_tvalid), .s_axis_tdata(s_axis_tdata), .s_axis_tlast(s_axis_tlast),
    .s_axis_tkeep(s_axis_tkeep), .s_axis_tready(s_axis_tready), .m_axis_tvalid(m_axis_tvalid), .m_axis_tdata(m_axis_tdata), .m_axis_tlast(m_axis_tlast),
    .m_axis_tkeep(m_axis_tkeep), .m_axis_tready(m_axis_tready));
endmodule
