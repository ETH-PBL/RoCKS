// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:rdma_mux_retrans_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "rdma_mux_retrans_wrapper,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "network_stack_rdma_mux_retrans_wra_0_0,rdma_mux_retrans_wrapper,{}" *)
(* CORE_GENERATION_INFO = "network_stack_rdma_mux_retrans_wra_0_0,rdma_mux_retrans_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=rdma_mux_retrans_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module network_stack_rdma_mux_retrans_wra_0_0 (
  nclk,
  nresetn,
  s_req_net_tvalid,
  s_req_net_tdata,
  s_req_net_tready,
  m_req_user_tvalid,
  m_req_user_tdata,
  m_req_user_tready,
  s_axis_user_req_tvalid,
  s_axis_user_req_tdata,
  s_axis_user_req_tready,
  s_axis_user_req_tlast,
  s_axis_user_req_tkeep,
  s_axis_user_rsp_tvalid,
  s_axis_user_rsp_tdata,
  s_axis_user_rsp_tready,
  s_axis_user_rsp_tlast,
  s_axis_user_rsp_tkeep,
  m_axis_net_tvalid,
  m_axis_net_tdata,
  m_axis_net_tready,
  m_axis_net_tlast,
  m_axis_net_tkeep,
  m_req_ddr_rd_tvalid,
  m_req_ddr_rd_tdata,
  m_req_ddr_rd_tready,
  m_req_ddr_wr_tvalid,
  m_req_ddr_wr_tdata,
  m_req_ddr_wr_tready,
  s_axis_ddr_tvalid,
  s_axis_ddr_tdata,
  s_axis_ddr_tready,
  s_axis_ddr_tlast,
  s_axis_ddr_tkeep,
  m_axis_ddr_tvalid,
  m_axis_ddr_tdata,
  m_axis_ddr_tready,
  m_axis_ddr_tlast,
  m_axis_ddr_tkeep
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nclk, ASSOCIATED_BUSIF s_req_net:m_req_user:s_axis_user_req:s_axis_user_rsp:m_axis_net:m_req_ddr_rd:m_req_ddr_wr:s_axis_ddr:m_axis_ddr, ASSOCIATED_RESET nresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, INSERT_VIP 0" *)
input wire nclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire nresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_req_net, TDATA_NUM_BYTES 18, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_req_net_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TDATA" *)
input wire [143 : 0] s_req_net_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_net TREADY" *)
output wire s_req_net_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_req_user, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_req_user_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TDATA" *)
output wire [255 : 0] m_req_user_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_user TREADY" *)
input wire m_req_user_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_user_req, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_axis_user_req_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TDATA" *)
input wire [511 : 0] s_axis_user_req_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TREADY" *)
output wire s_axis_user_req_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TLAST" *)
input wire s_axis_user_req_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_req TKEEP" *)
input wire [63 : 0] s_axis_user_req_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_user_rsp, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_axis_user_rsp_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TDATA" *)
input wire [511 : 0] s_axis_user_rsp_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TREADY" *)
output wire s_axis_user_rsp_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TLAST" *)
input wire s_axis_user_rsp_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_user_rsp TKEEP" *)
input wire [63 : 0] s_axis_user_rsp_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_net, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_axis_net_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TDATA" *)
output wire [511 : 0] m_axis_net_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TREADY" *)
input wire m_axis_net_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TLAST" *)
output wire m_axis_net_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_net TKEEP" *)
output wire [63 : 0] m_axis_net_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_req_ddr_rd, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_req_ddr_rd_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TDATA" *)
output wire [95 : 0] m_req_ddr_rd_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_rd TREADY" *)
input wire m_req_ddr_rd_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_req_ddr_wr, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_req_ddr_wr_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TDATA" *)
output wire [95 : 0] m_req_ddr_wr_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req_ddr_wr TREADY" *)
input wire m_req_ddr_wr_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_ddr, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_axis_ddr_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TDATA" *)
input wire [511 : 0] s_axis_ddr_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TREADY" *)
output wire s_axis_ddr_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TLAST" *)
input wire s_axis_ddr_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TKEEP" *)
input wire [63 : 0] s_axis_ddr_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_ddr, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_axis_ddr_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TDATA" *)
output wire [511 : 0] m_axis_ddr_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TREADY" *)
input wire m_axis_ddr_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TLAST" *)
output wire m_axis_ddr_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TKEEP" *)
output wire [63 : 0] m_axis_ddr_tkeep;

  rdma_mux_retrans_wrapper inst (
    .nclk(nclk),
    .nresetn(nresetn),
    .s_req_net_tvalid(s_req_net_tvalid),
    .s_req_net_tdata(s_req_net_tdata),
    .s_req_net_tready(s_req_net_tready),
    .m_req_user_tvalid(m_req_user_tvalid),
    .m_req_user_tdata(m_req_user_tdata),
    .m_req_user_tready(m_req_user_tready),
    .s_axis_user_req_tvalid(s_axis_user_req_tvalid),
    .s_axis_user_req_tdata(s_axis_user_req_tdata),
    .s_axis_user_req_tready(s_axis_user_req_tready),
    .s_axis_user_req_tlast(s_axis_user_req_tlast),
    .s_axis_user_req_tkeep(s_axis_user_req_tkeep),
    .s_axis_user_rsp_tvalid(s_axis_user_rsp_tvalid),
    .s_axis_user_rsp_tdata(s_axis_user_rsp_tdata),
    .s_axis_user_rsp_tready(s_axis_user_rsp_tready),
    .s_axis_user_rsp_tlast(s_axis_user_rsp_tlast),
    .s_axis_user_rsp_tkeep(s_axis_user_rsp_tkeep),
    .m_axis_net_tvalid(m_axis_net_tvalid),
    .m_axis_net_tdata(m_axis_net_tdata),
    .m_axis_net_tready(m_axis_net_tready),
    .m_axis_net_tlast(m_axis_net_tlast),
    .m_axis_net_tkeep(m_axis_net_tkeep),
    .m_req_ddr_rd_tvalid(m_req_ddr_rd_tvalid),
    .m_req_ddr_rd_tdata(m_req_ddr_rd_tdata),
    .m_req_ddr_rd_tready(m_req_ddr_rd_tready),
    .m_req_ddr_wr_tvalid(m_req_ddr_wr_tvalid),
    .m_req_ddr_wr_tdata(m_req_ddr_wr_tdata),
    .m_req_ddr_wr_tready(m_req_ddr_wr_tready),
    .s_axis_ddr_tvalid(s_axis_ddr_tvalid),
    .s_axis_ddr_tdata(s_axis_ddr_tdata),
    .s_axis_ddr_tready(s_axis_ddr_tready),
    .s_axis_ddr_tlast(s_axis_ddr_tlast),
    .s_axis_ddr_tkeep(s_axis_ddr_tkeep),
    .m_axis_ddr_tvalid(m_axis_ddr_tvalid),
    .m_axis_ddr_tdata(m_axis_ddr_tdata),
    .m_axis_ddr_tready(m_axis_ddr_tready),
    .m_axis_ddr_tlast(m_axis_ddr_tlast),
    .m_axis_ddr_tkeep(m_axis_ddr_tkeep)
  );
endmodule
