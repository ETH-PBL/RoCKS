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


// IP VLNV: xilinx.com:module_ref:sq_meta_iterations:1.0
// IP Revision: 1

(* X_CORE_INFO = "sq_meta_iterations,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "network_stack_sq_meta_iterations_0_0,sq_meta_iterations,{}" *)
(* CORE_GENERATION_INFO = "network_stack_sq_meta_iterations_0_0,sq_meta_iterations,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=sq_meta_iterations,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module network_stack_sq_meta_iterations_0_0 (
  nclk,
  nresetn,
  s_axis_sq_meta_tvalid,
  s_axis_sq_meta_tdata,
  s_axis_sq_meta_tready,
  s_axis_sq_meta_tlast,
  s_axis_sq_meta_tkeep,
  m_axis_sq_meta_tvalid,
  m_axis_sq_meta_tdata,
  m_axis_sq_meta_tready,
  m_axis_sq_meta_tlast,
  m_axis_sq_meta_tkeep,
  iterations
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nclk, ASSOCIATED_BUSIF s_axis_sq_meta:m_axis_sq_meta, ASSOCIATED_RESET nresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, INSERT_VIP 0" *)
input wire nclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire nresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_sq_meta, TDATA_NUM_BYTES 31, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_axis_sq_meta_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TDATA" *)
input wire [247 : 0] s_axis_sq_meta_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TREADY" *)
output wire s_axis_sq_meta_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TLAST" *)
input wire s_axis_sq_meta_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_sq_meta TKEEP" *)
input wire [30 : 0] s_axis_sq_meta_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_sq_meta, TDATA_NUM_BYTES 31, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_2_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire m_axis_sq_meta_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TDATA" *)
output wire [247 : 0] m_axis_sq_meta_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TREADY" *)
input wire m_axis_sq_meta_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TLAST" *)
output wire m_axis_sq_meta_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_sq_meta TKEEP" *)
output wire [30 : 0] m_axis_sq_meta_tkeep;
input wire [31 : 0] iterations;

  sq_meta_iterations inst (
    .nclk(nclk),
    .nresetn(nresetn),
    .s_axis_sq_meta_tvalid(s_axis_sq_meta_tvalid),
    .s_axis_sq_meta_tdata(s_axis_sq_meta_tdata),
    .s_axis_sq_meta_tready(s_axis_sq_meta_tready),
    .s_axis_sq_meta_tlast(s_axis_sq_meta_tlast),
    .s_axis_sq_meta_tkeep(s_axis_sq_meta_tkeep),
    .m_axis_sq_meta_tvalid(m_axis_sq_meta_tvalid),
    .m_axis_sq_meta_tdata(m_axis_sq_meta_tdata),
    .m_axis_sq_meta_tready(m_axis_sq_meta_tready),
    .m_axis_sq_meta_tlast(m_axis_sq_meta_tlast),
    .m_axis_sq_meta_tkeep(m_axis_sq_meta_tkeep),
    .iterations(iterations)
  );
endmodule
