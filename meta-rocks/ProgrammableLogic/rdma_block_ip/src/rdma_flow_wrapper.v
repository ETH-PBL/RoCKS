`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2026 02:39:27 PM
// Design Name: 
// Module Name: rdma_flow_wrapper
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


module rdma_flow_wrapper(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_req:m_req:s_ack:m_ack, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk,

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TVALID" *)
input wire s_req_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TDATA" *)
input wire[247:0] s_req_tdata,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
//input wire s_axis_tlast,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
//input wire [63:0] s_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TREADY" *)
output wire s_req_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TVALID" *)
output wire m_req_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TDATA" *)
output wire[247:0] m_req_tdata,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
//output wire m_axis_tlast,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
//output wire [63:0] m_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TREADY" *)
input wire m_req_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TVALID" *)
input wire s_ack_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TDATA" *)
input wire[63:0] s_ack_tdata,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
//input wire s_axis_tlast,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
//input wire [63:0] s_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TREADY" *)
output wire s_ack_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TVALID" *)
output wire m_ack_tvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TDATA" *)
output wire[55:0] m_ack_tdata,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
//output wire m_axis_tlast,
//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
//output wire [63:0] m_axis_tkeep,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TREADY" *)
input wire m_ack_tready

    );
    

    rdma_flow rdma_flow_inst(.aclk(nclk), .aresetn(nresetn), .s_req_tvalid(s_req_tvalid), .s_req_tdata(s_req_tdata), .s_req_tready(s_req_tready),
    .m_req_tvalid(m_req_tvalid), .m_req_tdata(m_req_tdata), .m_req_tready(m_req_tready), .s_ack_tvalid(s_ack_tvalid), .s_ack_tdata(s_ack_tdata), 
    .s_ack_tready(s_ack_tready), .m_ack_tvalid(m_ack_tvalid), .m_ack_tdata(m_ack_tdata), .m_ack_tready(m_ack_tready));
endmodule
