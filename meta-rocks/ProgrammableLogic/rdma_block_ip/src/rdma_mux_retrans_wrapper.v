`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2026 11:29:30 AM
// Design Name: 
// Module Name: rdma_mux_retrans_wrapper
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


module rdma_mux_retrans_wrapper(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_req_net:m_req_user:s_axis_user_req:s_axis_user_rsp:m_axis_net:m_req_ddr_rd:m_req_ddr_wr:s_axis_ddr:m_axis_ddr, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk, 

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,

//                                  s_req_net
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TVALID" *)
input wire s_req_net_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TDATA" *)
input wire [143:0] s_req_net_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TREADY" *)
output wire s_req_net_tready,

//                                  m_req_user
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TVALID" *)
output wire m_req_user_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TDATA" *)
output wire [255:0] m_req_user_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TREADY" *)
input wire m_req_user_tready,

//                                  s_axis_user_req
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TVALID" *)
input wire s_axis_user_req_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TDATA" *)
input wire[511:0] s_axis_user_req_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TREADY" *)
output wire s_axis_user_req_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TLAST" *)
input wire s_axis_user_req_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TKEEP" *)
input wire [63:0] s_axis_user_req_tkeep,

//                                  s_axis_user_rsp
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TVALID" *)
input wire s_axis_user_rsp_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TDATA" *)
input wire [511:0] s_axis_user_rsp_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TREADY" *)
output wire s_axis_user_rsp_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TLAST"*)
input wire s_axis_user_rsp_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TKEEP"*)
input wire [63:0] s_axis_user_rsp_tkeep,

//                                  m_axis_net
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TVALID" *) 
output wire m_axis_net_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TDATA" *) 
output wire [511:0] m_axis_net_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TREADY" *)
input wire m_axis_net_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TLAST" *) 
output wire m_axis_net_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TKEEP" *)  
output wire[63:0] m_axis_net_tkeep,

//                                  m_req_ddr_rd
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TVALID" *)
output wire m_req_ddr_rd_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TDATA" *)
output wire [95:0] m_req_ddr_rd_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TREADY" *)
input wire m_req_ddr_rd_tready,

//                                  m_req_ddr_wr
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TVALID" *)
output wire m_req_ddr_wr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TDATA" *)
output wire[95:0] m_req_ddr_wr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TREADY" *)
input wire m_req_ddr_wr_tready,

//                                  s_axis_ddr
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

//                                  m_axis_ddr
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TVALID" *)
output wire m_axis_ddr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TDATA" *)
output wire[511:0] m_axis_ddr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TREADY" *)
input wire m_axis_ddr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TLAST" *)
output wire m_axis_ddr_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TKEEP" *)
output wire [63:0] m_axis_ddr_tkeep
    );

    rdma_mux_retrans rdma_mux_retrans_inst(.aclk(nclk), .aresetn(nresetn), .s_req_net_tvalid(s_req_net_tvalid), .s_req_net_tdata(s_req_net_tdata), 
     .s_req_net_tready(s_req_net_tready), .m_req_user_tvalid(m_req_user_tvalid), .m_req_user_tdata(m_req_user_tdata), .m_req_user_tready(m_req_user_tready),
     .s_axis_user_req_tvalid(s_axis_user_req_tvalid), .s_axis_user_req_tdata(s_axis_user_req_tdata), .s_axis_user_req_tready(s_axis_user_req_tready), 
     .s_axis_user_req_tlast(s_axis_user_req_tlast), .s_axis_user_req_tkeep(s_axis_user_req_tkeep), .s_axis_user_rsp_tvalid(s_axis_user_rsp_tvalid), 
     .s_axis_user_rsp_tdata(s_axis_user_rsp_tdata), .s_axis_user_rsp_tready(s_axis_user_rsp_tready), .s_axis_user_rsp_tlast(s_axis_user_rsp_tlast), .s_axis_user_rsp_tkeep(s_axis_user_rsp_tkeep),
      .m_axis_net_tvalid(m_axis_net_tvalid), .m_axis_net_tdata(m_axis_net_tdata), .m_axis_net_tready(m_axis_net_tready), .m_axis_net_tlast(m_axis_net_tlast), 
       .m_axis_net_tkeep(m_axis_net_tkeep), .m_req_ddr_rd_tvalid(m_req_ddr_rd_tvalid), .m_req_ddr_rd_tdata(m_req_ddr_rd_tdata), .m_req_ddr_rd_tready(m_req_ddr_rd_tready),
       .m_req_ddr_wr_tvalid(m_req_ddr_wr_tvalid), .m_req_ddr_wr_tdata(m_req_ddr_wr_tdata), .m_req_ddr_wr_tready(m_req_ddr_wr_tready), .s_axis_ddr_tvalid(s_axis_ddr_tvalid),
       .s_axis_ddr_tdata(s_axis_ddr_tdata), .s_axis_ddr_tready(s_axis_ddr_tready), .s_axis_ddr_tlast(s_axis_ddr_tlast), .s_axis_ddr_tkeep(s_axis_ddr_tkeep), 
        .m_axis_ddr_tvalid(m_axis_ddr_tvalid), .m_axis_ddr_tdata(m_axis_ddr_tdata), .m_axis_ddr_tready(m_axis_ddr_tready),
         .m_axis_ddr_tlast(m_axis_ddr_tlast), .m_axis_ddr_tkeep(m_axis_ddr_tkeep) );
       
endmodule
