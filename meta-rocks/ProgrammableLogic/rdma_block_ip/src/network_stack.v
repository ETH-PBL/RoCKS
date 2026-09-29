//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed May  6 17:24:33 2026
//Host        : antermoia running 64-bit Ubuntu 24.04.2 LTS
//Command     : generate_target network_stack.bd
//Design      : network_stack
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module icmp_imp_7BI0FH
   (clk_250,
    dout,
    m_axis_arp_lookup_rep_tdata,
    m_axis_arp_lookup_rep_tready,
    m_axis_arp_lookup_rep_tvalid,
    m_axis_arp_tdata,
    m_axis_arp_tkeep,
    m_axis_arp_tlast,
    m_axis_arp_tready,
    m_axis_arp_tstrb,
    m_axis_arp_tvalid,
    m_axis_icmp_tdata,
    m_axis_icmp_tdest,
    m_axis_icmp_tkeep,
    m_axis_icmp_tlast,
    m_axis_icmp_tready,
    m_axis_icmp_tstrb,
    m_axis_icmp_tvalid,
    myMacAddress,
    reset_250,
    s_axis_arp_lookup_req_tdata,
    s_axis_arp_lookup_req_tready,
    s_axis_arp_lookup_req_tvalid,
    s_axis_arp_tdata,
    s_axis_arp_tkeep,
    s_axis_arp_tlast,
    s_axis_arp_tready,
    s_axis_arp_tstrb,
    s_axis_arp_tvalid,
    s_axis_icmp_tdata,
    s_axis_icmp_tkeep,
    s_axis_icmp_tlast,
    s_axis_icmp_tready,
    s_axis_icmp_tvalid);
  input clk_250;
  input [31:0]dout;
  output [55:0]m_axis_arp_lookup_rep_tdata;
  input m_axis_arp_lookup_rep_tready;
  output m_axis_arp_lookup_rep_tvalid;
  output [511:0]m_axis_arp_tdata;
  output [63:0]m_axis_arp_tkeep;
  output [0:0]m_axis_arp_tlast;
  input m_axis_arp_tready;
  output [63:0]m_axis_arp_tstrb;
  output m_axis_arp_tvalid;
  output [511:0]m_axis_icmp_tdata;
  output [0:0]m_axis_icmp_tdest;
  output [63:0]m_axis_icmp_tkeep;
  output m_axis_icmp_tlast;
  input m_axis_icmp_tready;
  output [63:0]m_axis_icmp_tstrb;
  output m_axis_icmp_tvalid;
  input [31:0]myMacAddress;
  input reset_250;
  input [31:0]s_axis_arp_lookup_req_tdata;
  output s_axis_arp_lookup_req_tready;
  input s_axis_arp_lookup_req_tvalid;
  input [511:0]s_axis_arp_tdata;
  input [63:0]s_axis_arp_tkeep;
  input [0:0]s_axis_arp_tlast;
  output s_axis_arp_tready;
  input [63:0]s_axis_arp_tstrb;
  input s_axis_arp_tvalid;
  input [511:0]s_axis_icmp_tdata;
  input [63:0]s_axis_icmp_tkeep;
  input [0:0]s_axis_icmp_tlast;
  output s_axis_icmp_tready;
  input s_axis_icmp_tvalid;

  wire [63:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire [7:0]axis_data_fifo_3_M_AXIS_TKEEP;
  wire axis_data_fifo_3_M_AXIS_TLAST;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  (* DEBUG = "true" *) wire [511:0]axis_dwidth_converter_1_M_AXIS_TDATA;
  (* DEBUG = "true" *) wire [0:0]axis_dwidth_converter_1_M_AXIS_TDEST;
  (* DEBUG = "true" *) wire [63:0]axis_dwidth_converter_1_M_AXIS_TKEEP;
  (* DEBUG = "true" *) wire axis_dwidth_converter_1_M_AXIS_TLAST;
  (* DEBUG = "true" *) wire axis_dwidth_converter_1_M_AXIS_TREADY;
  (* DEBUG = "true" *) wire [63:0]axis_dwidth_converter_1_M_AXIS_TSTRB;
  (* DEBUG = "true" *) wire axis_dwidth_converter_1_M_AXIS_TVALID;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire clk_out1_1;
  wire [31:0]dout;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]icmp_server_0_m_axis_TDATA;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]icmp_server_0_m_axis_TKEEP;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]icmp_server_0_m_axis_TLAST;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire icmp_server_0_m_axis_TREADY;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]icmp_server_0_m_axis_TSTRB;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire icmp_server_0_m_axis_TVALID;
  wire [55:0]m_axis_arp_lookup_rep_tdata;
  wire m_axis_arp_lookup_rep_tready;
  wire m_axis_arp_lookup_rep_tvalid;
  wire [511:0]m_axis_arp_tdata;
  wire [63:0]m_axis_arp_tkeep;
  wire [0:0]m_axis_arp_tlast;
  wire m_axis_arp_tready;
  wire [63:0]m_axis_arp_tstrb;
  wire m_axis_arp_tvalid;
  wire [31:0]myMacAddress;
  wire reset_250;
  (* DEBUG = "true" *) wire [31:0]s_axis_arp_lookup_req_1_TDATA;
  (* DEBUG = "true" *) wire s_axis_arp_lookup_req_1_TREADY;
  (* DEBUG = "true" *) wire s_axis_arp_lookup_req_1_TVALID;
  wire [511:0]s_axis_arp_tdata;
  wire [63:0]s_axis_arp_tkeep;
  wire [0:0]s_axis_arp_tlast;
  wire s_axis_arp_tready;
  wire [63:0]s_axis_arp_tstrb;
  wire s_axis_arp_tvalid;
  wire [511:0]s_axis_icmp_tdata;
  wire [63:0]s_axis_icmp_tkeep;
  wire [0:0]s_axis_icmp_tlast;
  wire s_axis_icmp_tready;
  wire s_axis_icmp_tvalid;
  wire [0:0]udpIn_TLAST_1;
  wire [0:0]xlconstant_1_dout;

  assign axis_dwidth_converter_1_M_AXIS_TREADY = m_axis_icmp_tready;
  assign clk_out1_1 = clk_250;
  assign m_axis_icmp_tdata[511:0] = axis_dwidth_converter_1_M_AXIS_TDATA;
  assign m_axis_icmp_tdest[0] = axis_dwidth_converter_1_M_AXIS_TDEST;
  assign m_axis_icmp_tkeep[63:0] = axis_dwidth_converter_1_M_AXIS_TKEEP;
  assign m_axis_icmp_tlast = axis_dwidth_converter_1_M_AXIS_TLAST;
  assign m_axis_icmp_tstrb[63:0] = axis_dwidth_converter_1_M_AXIS_TSTRB;
  assign m_axis_icmp_tvalid = axis_dwidth_converter_1_M_AXIS_TVALID;
  assign s_axis_arp_lookup_req_1_TDATA = s_axis_arp_lookup_req_tdata[31:0];
  assign s_axis_arp_lookup_req_1_TVALID = s_axis_arp_lookup_req_tvalid;
  assign s_axis_arp_lookup_req_tready = s_axis_arp_lookup_req_1_TREADY;
  network_stack_arp_server_subnet_0_0 arp_server_subnet_0
       (.ap_clk(clk_out1_1),
        .ap_rst_n(reset_250),
        .m_axis_TDATA(m_axis_arp_tdata),
        .m_axis_TKEEP(m_axis_arp_tkeep),
        .m_axis_TLAST(m_axis_arp_tlast),
        .m_axis_TREADY(m_axis_arp_tready),
        .m_axis_TSTRB(m_axis_arp_tstrb),
        .m_axis_TVALID(m_axis_arp_tvalid),
        .m_axis_arp_lookup_reply_TDATA(m_axis_arp_lookup_rep_tdata),
        .m_axis_arp_lookup_reply_TREADY(m_axis_arp_lookup_rep_tready),
        .m_axis_arp_lookup_reply_TVALID(m_axis_arp_lookup_rep_tvalid),
        .m_axis_host_arp_lookup_reply_TREADY(xlconstant_1_dout),
        .myIpAddress(dout),
        .myMacAddress({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,myMacAddress}),
        .s_axis_TDATA(s_axis_arp_tdata),
        .s_axis_TKEEP(s_axis_arp_tkeep),
        .s_axis_TLAST(s_axis_arp_tlast),
        .s_axis_TREADY(s_axis_arp_tready),
        .s_axis_TSTRB(s_axis_arp_tstrb),
        .s_axis_TVALID(s_axis_arp_tvalid),
        .s_axis_arp_lookup_request_TDATA(s_axis_arp_lookup_req_1_TDATA),
        .s_axis_arp_lookup_request_TREADY(s_axis_arp_lookup_req_1_TREADY),
        .s_axis_arp_lookup_request_TVALID(s_axis_arp_lookup_req_1_TVALID),
        .s_axis_host_arp_lookup_request_TDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_host_arp_lookup_request_TVALID(1'b0));
  network_stack_axis_dwidth_converter_0_0 axis_dwidth_converter_0
       (.aclk(clk_out1_1),
        .aresetn(reset_250),
        .m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_fifo_3_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_fifo_3_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_tdata(s_axis_icmp_tdata),
        .s_axis_tkeep(s_axis_icmp_tkeep),
        .s_axis_tlast(s_axis_icmp_tlast),
        .s_axis_tready(s_axis_icmp_tready),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(s_axis_icmp_tvalid));
  network_stack_axis_dwidth_converter_1_0 axis_dwidth_converter_1
       (.aclk(clk_out1_1),
        .aresetn(reset_250),
        .m_axis_tdata(axis_dwidth_converter_1_M_AXIS_TDATA),
        .m_axis_tdest(axis_dwidth_converter_1_M_AXIS_TDEST),
        .m_axis_tkeep(axis_dwidth_converter_1_M_AXIS_TKEEP),
        .m_axis_tlast(axis_dwidth_converter_1_M_AXIS_TLAST),
        .m_axis_tready(axis_dwidth_converter_1_M_AXIS_TREADY),
        .m_axis_tstrb(axis_dwidth_converter_1_M_AXIS_TSTRB),
        .m_axis_tvalid(axis_dwidth_converter_1_M_AXIS_TVALID),
        .s_axis_tdata(icmp_server_0_m_axis_TDATA),
        .s_axis_tdest(1'b0),
        .s_axis_tkeep(icmp_server_0_m_axis_TKEEP),
        .s_axis_tlast(icmp_server_0_m_axis_TLAST),
        .s_axis_tready(icmp_server_0_m_axis_TREADY),
        .s_axis_tstrb(icmp_server_0_m_axis_TSTRB),
        .s_axis_tvalid(icmp_server_0_m_axis_TVALID));
  network_stack_icmp_server_0_0 icmp_server_0
       (.ap_clk(clk_out1_1),
        .ap_rst_n(reset_250),
        .m_axis_TDATA(icmp_server_0_m_axis_TDATA),
        .m_axis_TKEEP(icmp_server_0_m_axis_TKEEP),
        .m_axis_TLAST(icmp_server_0_m_axis_TLAST),
        .m_axis_TREADY(icmp_server_0_m_axis_TREADY),
        .m_axis_TSTRB(icmp_server_0_m_axis_TSTRB),
        .m_axis_TVALID(icmp_server_0_m_axis_TVALID),
        .s_axis_TDATA(axis_data_fifo_3_M_AXIS_TDATA),
        .s_axis_TKEEP(axis_data_fifo_3_M_AXIS_TKEEP),
        .s_axis_TLAST(axis_data_fifo_3_M_AXIS_TLAST),
        .s_axis_TREADY(axis_data_fifo_3_M_AXIS_TREADY),
        .s_axis_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_TVALID(axis_data_fifo_3_M_AXIS_TVALID),
        .ttlIn_TDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,udpIn_TLAST_1}),
        .ttlIn_TKEEP({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,udpIn_TLAST_1}),
        .ttlIn_TLAST(udpIn_TLAST_1),
        .ttlIn_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,udpIn_TLAST_1}),
        .ttlIn_TVALID(udpIn_TLAST_1),
        .udpIn_TDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,udpIn_TLAST_1}),
        .udpIn_TKEEP({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,udpIn_TLAST_1}),
        .udpIn_TLAST(udpIn_TLAST_1),
        .udpIn_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,udpIn_TLAST_1}),
        .udpIn_TVALID(udpIn_TLAST_1));
  network_stack_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  network_stack_xlconstant_4_0 xlconstant_4
       (.dout(udpIn_TLAST_1));
endmodule

module m00_couplers_imp_DFB94K
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tstrb;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tstrb;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire [63:0]M_AXIS_tstrb;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [63:0]S_AXIS_tstrb;
  wire S_AXIS_tvalid;
  wire [511:0]m00_data_fifo_to_m00_regslice_TDATA;
  wire [63:0]m00_data_fifo_to_m00_regslice_TKEEP;
  wire m00_data_fifo_to_m00_regslice_TLAST;
  wire m00_data_fifo_to_m00_regslice_TREADY;
  wire [63:0]m00_data_fifo_to_m00_regslice_TSTRB;
  wire m00_data_fifo_to_m00_regslice_TVALID;

  network_stack_axis_interconnect_0_imp_m00_data_fifo_0 m00_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(m00_data_fifo_to_m00_regslice_TDATA),
        .m_axis_tkeep(m00_data_fifo_to_m00_regslice_TKEEP),
        .m_axis_tlast(m00_data_fifo_to_m00_regslice_TLAST),
        .m_axis_tready(m00_data_fifo_to_m00_regslice_TREADY),
        .m_axis_tstrb(m00_data_fifo_to_m00_regslice_TSTRB),
        .m_axis_tvalid(m00_data_fifo_to_m00_regslice_TVALID),
        .s_axis_aclk(S_AXIS_ACLK),
        .s_axis_aresetn(S_AXIS_ARESETN),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tstrb(S_AXIS_tstrb),
        .s_axis_tvalid(S_AXIS_tvalid));
  network_stack_axis_interconnect_0_imp_m00_regslice_0 m00_regslice
       (.aclk(M_AXIS_ACLK),
        .aresetn(M_AXIS_ARESETN),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(M_AXIS_tlast),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tstrb(M_AXIS_tstrb),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_tdata(m00_data_fifo_to_m00_regslice_TDATA),
        .s_axis_tkeep(m00_data_fifo_to_m00_regslice_TKEEP),
        .s_axis_tlast(m00_data_fifo_to_m00_regslice_TLAST),
        .s_axis_tready(m00_data_fifo_to_m00_regslice_TREADY),
        .s_axis_tstrb(m00_data_fifo_to_m00_regslice_TSTRB),
        .s_axis_tvalid(m00_data_fifo_to_m00_regslice_TVALID));
endmodule

module m00_couplers_imp_QC9D4L
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output [0:0]M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tstrb;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [0:0]S_AXIS_tdest;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tstrb;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire \^M_AXIS_tlast ;
  wire M_AXIS_tready;
  wire [63:0]M_AXIS_tstrb;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [0:0]S_AXIS_tdest;
  wire [63:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [63:0]S_AXIS_tstrb;
  wire S_AXIS_tvalid;
  wire [511:0]auto_ss_slidr_to_m00_regslice_TDATA;
  wire [0:0]auto_ss_slidr_to_m00_regslice_TDEST;
  wire [63:0]auto_ss_slidr_to_m00_regslice_TKEEP;
  wire auto_ss_slidr_to_m00_regslice_TLAST;
  wire auto_ss_slidr_to_m00_regslice_TREADY;
  wire [63:0]auto_ss_slidr_to_m00_regslice_TSTRB;
  wire auto_ss_slidr_to_m00_regslice_TVALID;
  wire [511:0]m00_data_fifo_to_auto_ss_slidr_TDATA;
  wire [0:0]m00_data_fifo_to_auto_ss_slidr_TDEST;
  wire [63:0]m00_data_fifo_to_auto_ss_slidr_TKEEP;
  wire m00_data_fifo_to_auto_ss_slidr_TLAST;
  wire m00_data_fifo_to_auto_ss_slidr_TREADY;
  wire [63:0]m00_data_fifo_to_auto_ss_slidr_TSTRB;
  wire m00_data_fifo_to_auto_ss_slidr_TVALID;

  assign M_AXIS_tlast[0] = \^M_AXIS_tlast ;
  network_stack_axis_interconnect_1_imp_auto_ss_slidr_0 auto_ss_slidr
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(auto_ss_slidr_to_m00_regslice_TDATA),
        .m_axis_tdest(auto_ss_slidr_to_m00_regslice_TDEST),
        .m_axis_tkeep(auto_ss_slidr_to_m00_regslice_TKEEP),
        .m_axis_tlast(auto_ss_slidr_to_m00_regslice_TLAST),
        .m_axis_tready(auto_ss_slidr_to_m00_regslice_TREADY),
        .m_axis_tstrb(auto_ss_slidr_to_m00_regslice_TSTRB),
        .m_axis_tvalid(auto_ss_slidr_to_m00_regslice_TVALID),
        .s_axis_tdata(m00_data_fifo_to_auto_ss_slidr_TDATA),
        .s_axis_tdest(m00_data_fifo_to_auto_ss_slidr_TDEST),
        .s_axis_tkeep(m00_data_fifo_to_auto_ss_slidr_TKEEP),
        .s_axis_tlast(m00_data_fifo_to_auto_ss_slidr_TLAST),
        .s_axis_tready(m00_data_fifo_to_auto_ss_slidr_TREADY),
        .s_axis_tstrb(m00_data_fifo_to_auto_ss_slidr_TSTRB),
        .s_axis_tvalid(m00_data_fifo_to_auto_ss_slidr_TVALID));
  network_stack_axis_interconnect_1_imp_m00_data_fifo_0 m00_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(m00_data_fifo_to_auto_ss_slidr_TDATA),
        .m_axis_tdest(m00_data_fifo_to_auto_ss_slidr_TDEST),
        .m_axis_tkeep(m00_data_fifo_to_auto_ss_slidr_TKEEP),
        .m_axis_tlast(m00_data_fifo_to_auto_ss_slidr_TLAST),
        .m_axis_tready(m00_data_fifo_to_auto_ss_slidr_TREADY),
        .m_axis_tstrb(m00_data_fifo_to_auto_ss_slidr_TSTRB),
        .m_axis_tvalid(m00_data_fifo_to_auto_ss_slidr_TVALID),
        .s_axis_aclk(S_AXIS_ACLK),
        .s_axis_aresetn(S_AXIS_ARESETN),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tdest(S_AXIS_tdest),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tstrb(S_AXIS_tstrb),
        .s_axis_tvalid(S_AXIS_tvalid));
  network_stack_axis_interconnect_1_imp_m00_regslice_0 m00_regslice
       (.aclk(M_AXIS_ACLK),
        .aresetn(M_AXIS_ARESETN),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(\^M_AXIS_tlast ),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tstrb(M_AXIS_tstrb),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_tdata(auto_ss_slidr_to_m00_regslice_TDATA),
        .s_axis_tdest(auto_ss_slidr_to_m00_regslice_TDEST),
        .s_axis_tkeep(auto_ss_slidr_to_m00_regslice_TKEEP),
        .s_axis_tlast(auto_ss_slidr_to_m00_regslice_TLAST),
        .s_axis_tready(auto_ss_slidr_to_m00_regslice_TREADY),
        .s_axis_tstrb(auto_ss_slidr_to_m00_regslice_TSTRB),
        .s_axis_tvalid(auto_ss_slidr_to_m00_regslice_TVALID));
endmodule

(* CORE_GENERATION_INFO = "network_stack,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=network_stack,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=64,numReposBlks=54,numNonXlnxBlks=6,numHierBlks=10,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=7,numHdlrefBlks=10,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "network_stack.hwdef" *) 
module network_stack #
(
  parameter integer DEFAULT_IP_ADDRESS = 32'h1401a8c0,
  parameter integer DEFAULT_MAC_ADDRESS = 32'h12341234,
  parameter integer C_S_AXI_DATA_WIDTH	= 32,
  parameter integer C_S_AXI_ADDR_WIDTH	= 6
)
(
  M_AXIS_tdata,
  M_AXIS_tkeep,
  M_AXIS_tlast,
  M_AXIS_tready,
  M_AXIS_tstrb,
  M_AXIS_tvalid,
  S_AXIS_tdata,
  S_AXIS_tkeep,
  S_AXIS_tlast,
  S_AXIS_tready,
  S_AXIS_tuser,
  S_AXIS_tvalid,
  clk_250,
  clk_322,
  ext_reset_in_322,
  interrupt,
  reset_250,
  s_axi_control_araddr,
  s_axi_control_arready,
  s_axi_control_arvalid,
  s_axi_control_awaddr,
  s_axi_control_awready,
  s_axi_control_awvalid,
  s_axi_control_bready,
  s_axi_control_bresp,
  s_axi_control_bvalid,
  s_axi_control_rdata,
  s_axi_control_rready,
  s_axi_control_rresp,
  s_axi_control_rvalid,
  s_axi_control_wdata,
  s_axi_control_wready,
  s_axi_control_wstrb,
  s_axi_control_wvalid,
  s_axis_data_tdata,
  s_axis_data_tuser,
  s_axis_data_tvalid,
  s_axi_debug_AWADDR,
  s_axi_debug_AWPROT,
  s_axi_debug_AWVALID,
  s_axi_debug_AWREADY,
  s_axi_debug_WDATA, 
  s_axi_debug_WSTRB,
  s_axi_debug_WVALID,
  s_axi_debug_WREADY,
  s_axi_debug_BRESP,
  s_axi_debug_BVALID,
  s_axi_debug_BREADY,
  s_axi_debug_ARADDR,
  s_axi_debug_ARPROT,
  s_axi_debug_ARVALID,
  s_axi_debug_ARREADY,
  s_axi_debug_RDATA,
  s_axi_debug_RRESP,
  s_axi_debug_RVALID,
  s_axi_debug_RREADY);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [511:0]M_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [63:0]M_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output [0:0]M_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TSTRB" *) output [63:0]M_AXIS_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output M_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) input [511:0]S_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [63:0]S_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input S_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input [0:0]S_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_250 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_250, ASSOCIATED_BUSIF s_axi_control:s_axis_data:s_axi_debug, ASSOCIATED_RESET reset_250, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_250;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_322 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_322, ASSOCIATED_BUSIF M_AXIS:S_AXIS, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_322;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_322 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_322, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ext_reset_in_322;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_250 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_250, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_250;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [5:0]s_axi_control_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [5:0]s_axi_control_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_data TDATA" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_data, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 128, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4" *) input [1023:0]s_axis_data_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_data TUSER" *) input [3:0]s_axis_data_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_data TVALID" *) input s_axis_data_tvalid;

  // Read address (issued by master, acceped by Slave)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_debug, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_debug_ARADDR;
  // Write address (issued by master, acceped by Slave)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug AWADDR" *) input [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_debug_AWADDR;
  // Write channel Protection type. This signal indicates the
  // privilege and security level of the transaction, and whether
  // the transaction is a data access or an instruction access.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug AWPROT" *) input [2 : 0] s_axi_debug_AWPROT;
  // Write address valid. This signal indicates that the master signaling
  // valid write address and control information.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug AWVALID" *) input s_axi_debug_AWVALID;
  // Write address ready. This signal indicates that the slave is ready
  // to accept an address and associated control signals.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug AWREADY" *) output s_axi_debug_AWREADY;
  // Write data (issued by master, acceped by Slave) 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug WDATA" *) input [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_debug_WDATA;
  // Write strobes. This signal indicates which byte lanes hold
  // valid data. There is one write strobe bit for each eight
  // bits of the write data bus.    
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug WSTRB" *) input [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_debug_WSTRB;
  // Write valid. This signal indicates that valid write
  // data and strobes are available.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug WVALID" *) input s_axi_debug_WVALID;
  // Write ready. This signal indicates that the slave
  // can accept the write data.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug WREADY" *) output s_axi_debug_WREADY;
  // Write response. This signal indicates the status
  // of the write transaction.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug BRESP" *) output [1 : 0] s_axi_debug_BRESP;
  // Write response valid. This signal indicates that the channel
  // is signaling a valid write response.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug BVALID" *) output s_axi_debug_BVALID;
  // Response ready. This signal indicates that the master
  // can accept a write response.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug BREADY" *) input s_axi_debug_BREADY;
  // Protection type. This signal indicates the privilege
  // and security level of the transaction, and whether the
  // transaction is a data access or an instruction access.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug ARPROT" *) input [2 : 0] s_axi_debug_ARPROT;
  // Read address valid. This signal indicates that the channel
  // is signaling valid read address and control information.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug ARVALID" *) input s_axi_debug_ARVALID;
  // Read address ready. This signal indicates that the slave is
  // ready to accept an address and associated control signals.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug ARREADY" *) output s_axi_debug_ARREADY;
  // Read data (issued by slave)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug RDATA" *) output [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_debug_RDATA;
  // Read response. This signal indicates the status of the
  // read transfer.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug RRESP" *) output [1 : 0] s_axi_debug_RRESP;
  // Read valid. This signal indicates that the channel is
  // signaling the required read data.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug RVALID" *) output s_axi_debug_RVALID;
  // Read ready. This signal indicates that the master can
  // accept the read data and response information.
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_debug RREADY" *) input s_axi_debug_RREADY;


  wire [31:0]S01_ARB_REQ_SUPPRESS_1;
  wire [511:0]S01_AXIS_1_TDATA;
  wire [63:0]S01_AXIS_1_TKEEP;
  wire [0:0]S01_AXIS_1_TLAST;
  wire S01_AXIS_1_TREADY;
  wire [63:0]S01_AXIS_1_TSTRB;
  wire S01_AXIS_1_TVALID;
  wire [511:0]S01_AXIS_2_TDATA;
  wire [63:0]S01_AXIS_2_TKEEP;
  wire S01_AXIS_2_TLAST;
  wire S01_AXIS_2_TREADY;
  wire S01_AXIS_2_TVALID;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [0:0]S_AXIS_tuser;
  wire S_AXIS_tvalid;
  wire [511:0]ack_counter_0_m_ack_TDATA;
  wire [63:0]ack_counter_0_m_ack_TKEEP;
  wire ack_counter_0_m_ack_TLAST;
  wire ack_counter_0_m_ack_TREADY;
  wire ack_counter_0_m_ack_TVALID;
  wire [247:0]ack_counter_0_m_req_TDATA;
  wire ack_counter_0_m_req_TREADY;
  wire ack_counter_0_m_req_TVALID;
  wire [511:0]axis_data_cdc_fifo_M_AXIS_TDATA;
  wire [63:0]axis_data_cdc_fifo_M_AXIS_TKEEP;
  wire axis_data_cdc_fifo_M_AXIS_TLAST;
  wire axis_data_cdc_fifo_M_AXIS_TREADY;
  wire [63:0]axis_data_cdc_fifo_M_AXIS_TSTRB;
  wire axis_data_cdc_fifo_M_AXIS_TVALID;
  wire [511:0]axis_data_pkt_fifo_1_M_AXIS_TDATA;
  wire [63:0]axis_data_pkt_fifo_1_M_AXIS_TKEEP;
  wire axis_data_pkt_fifo_1_M_AXIS_TLAST;
  wire axis_data_pkt_fifo_1_M_AXIS_TREADY;
  wire [63:0]axis_data_pkt_fifo_1_M_AXIS_TSTRB;
  wire axis_data_pkt_fifo_1_M_AXIS_TVALID;
  wire [511:0]axis_data_rx_cdc_fifo_M_AXIS_TDATA;
  wire [63:0]axis_data_rx_cdc_fifo_M_AXIS_TKEEP;
  wire axis_data_rx_cdc_fifo_M_AXIS_TLAST;
  wire axis_data_rx_cdc_fifo_M_AXIS_TREADY;
  wire axis_data_rx_cdc_fifo_M_AXIS_TVALID;
  wire [511:0]axis_interconnect_0_M00_AXIS_TDATA;
  wire [63:0]axis_interconnect_0_M00_AXIS_TKEEP;
  wire axis_interconnect_0_M00_AXIS_TLAST;
  wire axis_interconnect_0_M00_AXIS_TREADY;
  wire [63:0]axis_interconnect_0_M00_AXIS_TSTRB;
  wire axis_interconnect_0_M00_AXIS_TVALID;
  wire [511:0]axis_interconnect_1_M00_AXIS_TDATA;
  wire [63:0]axis_interconnect_1_M00_AXIS_TKEEP;
  wire [0:0]axis_interconnect_1_M00_AXIS_TLAST;
  wire axis_interconnect_1_M00_AXIS_TREADY;
  wire [63:0]axis_interconnect_1_M00_AXIS_TSTRB;
  wire axis_interconnect_1_M00_AXIS_TVALID;
  wire clk_322;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire clk_wiz_0_clk_out1;
  (* DEBUG = "true" *) wire [511:0]ethernet_frame_paddi_1_m_axis_TDATA;
  (* DEBUG = "true" *) wire [63:0]ethernet_frame_paddi_1_m_axis_TKEEP;
  (* DEBUG = "true" *) wire [0:0]ethernet_frame_paddi_1_m_axis_TLAST;
  (* DEBUG = "true" *) wire ethernet_frame_paddi_1_m_axis_TREADY;
  (* DEBUG = "true" *) wire [63:0]ethernet_frame_paddi_1_m_axis_TSTRB;
  (* DEBUG = "true" *) wire ethernet_frame_paddi_1_m_axis_TVALID;
  wire ext_reset_in_322;
  wire [55:0]icmp_M_AXIS1_TDATA;
  wire icmp_M_AXIS1_TREADY;
  wire icmp_M_AXIS1_TVALID;
  (* DEBUG = "true" *) wire [511:0]icmp_m_axis_icmp_TDATA;
  (* DEBUG = "true" *) wire [0:0]icmp_m_axis_icmp_TDEST;
  (* DEBUG = "true" *) wire [63:0]icmp_m_axis_icmp_TKEEP;
  (* DEBUG = "true" *) wire icmp_m_axis_icmp_TLAST;
  (* DEBUG = "true" *) wire icmp_m_axis_icmp_TREADY;
  (* DEBUG = "true" *) wire [63:0]icmp_m_axis_icmp_TSTRB;
  (* DEBUG = "true" *) wire icmp_m_axis_icmp_TVALID;
  wire [511:0]ip_handler_0_m_axis_arp_TDATA;
  wire [63:0]ip_handler_0_m_axis_arp_TKEEP;
  wire [0:0]ip_handler_0_m_axis_arp_TLAST;
  wire ip_handler_0_m_axis_arp_TREADY;
  wire [63:0]ip_handler_0_m_axis_arp_TSTRB;
  wire ip_handler_0_m_axis_arp_TVALID;
  wire [511:0]ip_handler_0_m_axis_icmp_TDATA;
  wire [63:0]ip_handler_0_m_axis_icmp_TKEEP;
  wire [0:0]ip_handler_0_m_axis_icmp_TLAST;
  wire ip_handler_0_m_axis_icmp_TREADY;
  wire ip_handler_0_m_axis_icmp_TVALID;
  wire [511:0]ip_handler_0_m_axis_roce_TDATA;
  wire [63:0]ip_handler_0_m_axis_roce_TKEEP;
  wire [0:0]ip_handler_0_m_axis_roce_TLAST;
  wire ip_handler_0_m_axis_roce_TREADY;
  wire ip_handler_0_m_axis_roce_TVALID;
  (* DEBUG = "true" *) wire [31:0]mac_ip_encode_0_m_axis_arp_lookup_request_TDATA;
  (* DEBUG = "true" *) wire mac_ip_encode_0_m_axis_arp_lookup_request_TREADY;
  (* DEBUG = "true" *) wire mac_ip_encode_0_m_axis_arp_lookup_request_TVALID;
  wire [511:0]mac_ip_encode_0_m_axis_ip_TDATA;
  wire [63:0]mac_ip_encode_0_m_axis_ip_TKEEP;
  wire [0:0]mac_ip_encode_0_m_axis_ip_TLAST;
  wire mac_ip_encode_0_m_axis_ip_TREADY;
  wire [63:0]mac_ip_encode_0_m_axis_ip_TSTRB;
  wire mac_ip_encode_0_m_axis_ip_TVALID;
  wire [0:0]proc_sys_reset_0_interconnect_aresetn;
  wire [31:0]regCrcDropPkgCount_out;
  wire [31:0]regIbvCountRx_out;
  wire [31:0]regIbvCountTx_out;
  wire [31:0]regInvalidPsnDropCount_out;
  wire [31:0]regRetransCount_out;
  wire [63:0] dbg_cycles_count_out;
  wire [31:0] dbg_acks_out;
  wire [31:0] dbg_sq_metas_out;
  wire reset_250;
  wire [5:0]s_axi_control_araddr;
  wire s_axi_control_arready;
  wire s_axi_control_arvalid;
  wire [5:0]s_axi_control_awaddr;
  wire s_axi_control_awready;
  wire s_axi_control_awvalid;
  wire s_axi_control_bready;
  wire [1:0]s_axi_control_bresp;
  wire s_axi_control_bvalid;
  wire [31:0]s_axi_control_rdata;
  wire s_axi_control_rready;
  wire [1:0]s_axi_control_rresp;
  wire s_axi_control_rvalid;
  wire [31:0]s_axi_control_wdata;
  wire s_axi_control_wready;
  wire [3:0]s_axi_control_wstrb;
  wire s_axi_control_wvalid;
  wire [1023:0]s_axis_data_tdata;
  wire [3:0]s_axis_data_tuser;
  wire s_axis_data_tvalid;
  wire [31:0]stream_generator_0_number_iterations;
  wire [15:0]stream_generator_0_packet_length;
  wire [183:0]stream_generator_0_qp_conn_TDATA;
  wire stream_generator_0_qp_conn_TREADY;
  wire stream_generator_0_qp_conn_TVALID;
  wire [183:0]stream_generator_0_qp_interface_TDATA;
  wire stream_generator_0_qp_interface_TREADY;
  wire stream_generator_0_qp_interface_TVALID;
  wire [247:0]stream_generator_0_sq_meta1_TDATA;
  wire stream_generator_0_sq_meta1_TREADY;
  wire stream_generator_0_sq_meta1_TVALID;
  wire [247:0]stream_generator_0_sq_meta2_TDATA;
  wire [30:0]stream_generator_0_sq_meta2_TKEEP;
  wire [0:0]stream_generator_0_sq_meta2_TLAST;
  wire stream_generator_0_sq_meta2_TREADY;
  wire stream_generator_0_sq_meta2_TVALID;
  wire [31:0]xlconstant_0_dout;
  wire [31:0]xlconstant_7_dout;
  wire [0:0]xlconstant_8_dout;


  // AXI4LITE signals
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
  reg axi_awready;
  reg axi_wready;
  reg [1 : 0] axi_bresp;
  reg axi_bvalid;
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
  reg axi_arready;
  reg [1 : 0] axi_rresp;
  reg axi_rvalid;

  // Example-specific design signals
  // local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
  // ADDR_LSB is used for addressing 32/64 bit registers/memories
  // ADDR_LSB = 2 for 32 bits (n downto 2)
  // ADDR_LSB = 3 for 64 bits (n downto 3)
  localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
  localparam integer OPT_MEM_ADDR_BITS = 3;
  //----------------------------------------------
  //-- Signals for user logic register space example
  //------------------------------------------------
  //-- Number of Slave Registers 10

  reg [C_S_AXI_DATA_WIDTH-1:0] myIpAddress;
  reg [C_S_AXI_DATA_WIDTH-1:0] myMacAddress;
  reg [C_S_AXI_DATA_WIDTH-1:0] regCrcDropPkgCount;
  reg [C_S_AXI_DATA_WIDTH-1:0] regIbvCountRx;
  reg [C_S_AXI_DATA_WIDTH-1:0] regIbvCountTx;
  reg [C_S_AXI_DATA_WIDTH-1:0] regInvalidPsnDropCount;
  reg [C_S_AXI_DATA_WIDTH-1:0] regRetransCount;
  reg [C_S_AXI_DATA_WIDTH-1:0] dbg_cycles_count;
  reg [C_S_AXI_DATA_WIDTH-1:0] dbg_acks;
  reg [C_S_AXI_DATA_WIDTH-1:0] dbg_sq_metas;
  integer byte_index;

  // I/O Connections assignments

  assign s_axi_debug_AWREADY	  = axi_awready;
  assign s_axi_debug_WREADY	    = axi_wready;
  assign s_axi_debug_BRESP	    = axi_bresp;
  assign s_axi_debug_BVALID	    = axi_bvalid;
  assign s_axi_debug_ARREADY	  = axi_arready;
  assign s_axi_debug_RRESP	    = axi_rresp;
  assign s_axi_debug_RVALID	    = axi_rvalid;
  //state machine varibles 
  reg [1:0] state_write;
  reg [1:0] state_read;
  //State machine local parameters
  localparam Idle = 2'b00,Raddr = 2'b10,Rdata = 2'b11 ,Waddr = 2'b10,Wdata = 2'b11;
  // Implement Write state machine
  // Outstanding write transactions are not supported by the slave i.e., master should assert bready to receive response on or before it starts sending the new transaction
  always @(posedge clk_250) begin
    if (reset_250 == 1'b0) begin
      axi_awready <= 0;
      axi_wready <= 0;
      axi_bvalid <= 0;
      axi_bresp <= 0;
      axi_awaddr <= 0;
      state_write <= Idle;
    end else begin
      case(state_write)
        Idle: begin
          if(reset_250 == 1'b1) begin
                axi_awready <= 1'b1;
                axi_wready <= 1'b1;
                state_write <= Waddr;
          end else begin
            state_write <= state_write;
          end
        end
        Waddr: begin //At this state, slave is ready to receive address along with corresponding control signals and first data packet. Response valid is also handled at this state
          if (s_axi_debug_AWVALID && s_axi_debug_AWREADY) begin
            axi_awaddr <= s_axi_debug_AWADDR;
            if(s_axi_debug_WVALID) begin
                axi_awready <= 1'b1;
                state_write <= Waddr;
                axi_bvalid <= 1'b1;
              end else begin
                axi_awready <= 1'b0;
                state_write <= Wdata;
                if (s_axi_debug_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
              end
            end
          else begin
            state_write <= state_write;
            if (s_axi_debug_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
          end
        end
        Wdata: begin //At this state, slave is ready to receive the data packets until the number of transfers is equal to burst length
          if (s_axi_debug_WVALID) begin
            state_write <= Waddr;
            axi_bvalid <= 1'b1;
            axi_awready <= 1'b1;
          end else begin
            state_write <= state_write;
            if (s_axi_debug_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
          end
        end
      endcase
    end
  end

  // Implement memory mapped register select and write logic generation
  // The write data is accepted and written to memory mapped registers when
  // axi_awready, s_axi_debug_WVALID, axi_wready and s_axi_debug_WVALID are asserted. Write strobes are used to
  // select byte enables of slave registers while writing.
  // These registers are cleared when reset (active low) is applied.
  // Slave register write enable is asserted when valid address and data are available
  // and the slave is ready to accept the write address and write data.
      

  always @( posedge clk_250 ) begin
    if ( reset_250 == 1'b0 ) begin
      myIpAddress <= DEFAULT_IP_ADDRESS;
      myMacAddress <= DEFAULT_MAC_ADDRESS;
      regCrcDropPkgCount <= 0;
      regIbvCountRx <= 0;
      regIbvCountTx <= 0;
      regInvalidPsnDropCount <= 0;
      regRetransCount <= 0;
      dbg_cycles_count <= 0;
      dbg_acks <= 0;
      dbg_sq_metas <= 0;
    end else begin
      regCrcDropPkgCount <= regCrcDropPkgCount_out;
      regIbvCountRx <= regIbvCountRx_out;
      regIbvCountTx <= regIbvCountTx_out;
      regInvalidPsnDropCount <= regInvalidPsnDropCount_out;
      regRetransCount <= regRetransCount_out;
      dbg_cycles_count <= dbg_cycles_count_out;
      dbg_acks <= dbg_acks_out;
      dbg_sq_metas <= dbg_sq_metas_out;

      if (s_axi_debug_WVALID) begin
        case ( (s_axi_debug_AWVALID) ? s_axi_debug_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] : axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
          4'h0:
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( s_axi_debug_WSTRB[byte_index] == 1 ) begin
                // Respective byte enables are asserted as per write strobes
                // Slave register 0
                myIpAddress[(byte_index*8) +: 8] <= s_axi_debug_WDATA[(byte_index*8) +: 8];
              end
          4'h1:
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( s_axi_debug_WSTRB[byte_index] == 1 ) begin
                // Respective byte enables are asserted as per write strobes 
                // Slave register 1
                myMacAddress[(byte_index*8) +: 8] <= s_axi_debug_WDATA[(byte_index*8) +: 8];
              end
          default : begin
            myIpAddress <= myIpAddress;
            myMacAddress <= myMacAddress;
          end
        endcase
      end
    end
  end    

  // Implement read state machine
  always @(posedge clk_250) begin
    if (reset_250 == 1'b0) begin
      //asserting initial values to all 0's during reset
      axi_arready <= 1'b0;
      axi_rvalid <= 1'b0;
      axi_rresp <= 1'b0;
      state_read <= Idle;
    end else begin
      case(state_read)
        Idle: begin //Initial state inidicating reset is done and ready to receive read/write transactions
          if (reset_250 == 1'b1) begin
            state_read <= Raddr;
            axi_arready <= 1'b1;
          end else state_read <= state_read;
        end
        Raddr: begin //At this state, slave is ready to receive address along with corresponding control signals
          if (s_axi_debug_ARVALID && s_axi_debug_ARREADY) begin
            state_read <= Rdata;
            axi_araddr <= s_axi_debug_ARADDR;
            axi_rvalid <= 1'b1;
            axi_arready <= 1'b0;
          end else state_read <= state_read;
        end
        Rdata: begin //At this state, slave is ready to send the data packets until the number of transfers is equal to burst length
          if (s_axi_debug_RVALID && s_axi_debug_RREADY) begin
            axi_rvalid <= 1'b0;
            axi_arready <= 1'b1;
            state_read <= Raddr;
          end else state_read <= state_read;
        end
      endcase
    end
  end
  // Implement memory mapped register select and read logic generation
  assign s_axi_debug_RDATA = (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h0) ? myIpAddress : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h1) ? myMacAddress : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h2) ? regCrcDropPkgCount : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h3) ? regIbvCountRx : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h4) ? regIbvCountTx : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h5) ? regInvalidPsnDropCount : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h6) ? regRetransCount : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h7) ? dbg_cycles_count : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h8) ? dbg_acks : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4'h9) ? dbg_sq_metas : 0;


  assign M_AXIS_tdata[511:0] = ethernet_frame_paddi_1_m_axis_TDATA;
  assign M_AXIS_tkeep[63:0] = ethernet_frame_paddi_1_m_axis_TKEEP;
  assign M_AXIS_tlast[0] = ethernet_frame_paddi_1_m_axis_TLAST;
  assign M_AXIS_tstrb[63:0] = ethernet_frame_paddi_1_m_axis_TSTRB;
  assign M_AXIS_tvalid = ethernet_frame_paddi_1_m_axis_TVALID;
  assign clk_wiz_0_clk_out1 = clk_250;
  assign ethernet_frame_paddi_1_m_axis_TREADY = M_AXIS_tready;
  network_stack_ack_counter_0_0 ack_counter_0
       (.clk(clk_wiz_0_clk_out1),
        .iterations(stream_generator_0_number_iterations),
        .cycles_count(dbg_cycles_count_out),
        .acks(dbg_acks_out),
        .sq_metas(dbg_sq_metas_out),
        .m_ack_tdata(ack_counter_0_m_ack_TDATA),
        .m_ack_tkeep(ack_counter_0_m_ack_TKEEP),
        .m_ack_tlast(ack_counter_0_m_ack_TLAST),
        .m_ack_tready(ack_counter_0_m_ack_TREADY),
        .m_ack_tvalid(ack_counter_0_m_ack_TVALID),
        .m_req_tdata(ack_counter_0_m_req_TDATA),
        .m_req_tready(ack_counter_0_m_req_TREADY),
        .m_req_tvalid(ack_counter_0_m_req_TVALID),
        .rst(reset_250),
        .s_ack_tdata(ip_handler_0_m_axis_roce_TDATA),
        .s_ack_tkeep(ip_handler_0_m_axis_roce_TKEEP),
        .s_ack_tlast(ip_handler_0_m_axis_roce_TLAST),
        .s_ack_tready(ip_handler_0_m_axis_roce_TREADY),
        .s_ack_tvalid(ip_handler_0_m_axis_roce_TVALID),
        .s_req_tdata(stream_generator_0_sq_meta1_TDATA),
        .s_req_tready(stream_generator_0_sq_meta1_TREADY),
        .s_req_tvalid(stream_generator_0_sq_meta1_TVALID));
  network_stack_axis_data_cdc_fifo_0 axis_data_cdc_fifo
       (.m_axis_aclk(clk_322),
        .m_axis_tdata(axis_data_cdc_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_cdc_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_cdc_fifo_M_AXIS_TLAST),
        .m_axis_tready(axis_data_cdc_fifo_M_AXIS_TREADY),
        .m_axis_tstrb(axis_data_cdc_fifo_M_AXIS_TSTRB),
        .m_axis_tvalid(axis_data_cdc_fifo_M_AXIS_TVALID),
        .s_axis_aclk(clk_wiz_0_clk_out1),
        .s_axis_aresetn(reset_250),
        .s_axis_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .s_axis_tkeep(axis_interconnect_0_M00_AXIS_TKEEP),
        .s_axis_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .s_axis_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .s_axis_tstrb(axis_interconnect_0_M00_AXIS_TSTRB),
        .s_axis_tvalid(axis_interconnect_0_M00_AXIS_TVALID));
  network_stack_axis_data_pkt_fifo_1_0 axis_data_pkt_fifo_1
       (.m_axis_tdata(axis_data_pkt_fifo_1_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_pkt_fifo_1_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_pkt_fifo_1_M_AXIS_TLAST),
        .m_axis_tready(axis_data_pkt_fifo_1_M_AXIS_TREADY),
        .m_axis_tstrb(axis_data_pkt_fifo_1_M_AXIS_TSTRB),
        .m_axis_tvalid(axis_data_pkt_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(clk_322),
        .s_axis_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .s_axis_tdata(axis_data_cdc_fifo_M_AXIS_TDATA),
        .s_axis_tkeep(axis_data_cdc_fifo_M_AXIS_TKEEP),
        .s_axis_tlast(axis_data_cdc_fifo_M_AXIS_TLAST),
        .s_axis_tready(axis_data_cdc_fifo_M_AXIS_TREADY),
        .s_axis_tstrb(axis_data_cdc_fifo_M_AXIS_TSTRB),
        .s_axis_tvalid(axis_data_cdc_fifo_M_AXIS_TVALID));
  network_stack_axis_data_rx_cdc_fifo_0 axis_data_rx_cdc_fifo
       (.m_axis_aclk(clk_wiz_0_clk_out1),
        .m_axis_tdata(axis_data_rx_cdc_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_rx_cdc_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_rx_cdc_fifo_M_AXIS_TLAST),
        .m_axis_tready(axis_data_rx_cdc_fifo_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_rx_cdc_fifo_M_AXIS_TVALID),
        .s_axis_aclk(clk_322),
        .s_axis_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tuser(S_AXIS_tuser),
        .s_axis_tvalid(S_AXIS_tvalid));
  network_stack_axis_interconnect_0_0 axis_interconnect_0
       (.ACLK(clk_wiz_0_clk_out1),
        .ARESETN(reset_250),
        .M00_AXIS_ACLK(clk_wiz_0_clk_out1),
        .M00_AXIS_ARESETN(reset_250),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .M00_AXIS_tkeep(axis_interconnect_0_M00_AXIS_TKEEP),
        .M00_AXIS_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .M00_AXIS_tstrb(axis_interconnect_0_M00_AXIS_TSTRB),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .S00_ARB_REQ_SUPPRESS(S01_ARB_REQ_SUPPRESS_1),
        .S00_AXIS_ACLK(clk_wiz_0_clk_out1),
        .S00_AXIS_ARESETN(reset_250),
        .S00_AXIS_tdata(mac_ip_encode_0_m_axis_ip_TDATA),
        .S00_AXIS_tkeep(mac_ip_encode_0_m_axis_ip_TKEEP),
        .S00_AXIS_tlast(mac_ip_encode_0_m_axis_ip_TLAST),
        .S00_AXIS_tready(mac_ip_encode_0_m_axis_ip_TREADY),
        .S00_AXIS_tstrb(mac_ip_encode_0_m_axis_ip_TSTRB),
        .S00_AXIS_tvalid(mac_ip_encode_0_m_axis_ip_TVALID),
        .S01_ARB_REQ_SUPPRESS(S01_ARB_REQ_SUPPRESS_1),
        .S01_AXIS_ACLK(clk_wiz_0_clk_out1),
        .S01_AXIS_ARESETN(reset_250),
        .S01_AXIS_tdata(S01_AXIS_1_TDATA),
        .S01_AXIS_tkeep(S01_AXIS_1_TKEEP),
        .S01_AXIS_tlast(S01_AXIS_1_TLAST),
        .S01_AXIS_tready(S01_AXIS_1_TREADY),
        .S01_AXIS_tstrb(S01_AXIS_1_TSTRB),
        .S01_AXIS_tvalid(S01_AXIS_1_TVALID));
  network_stack_axis_interconnect_1_0 axis_interconnect_1
       (.ACLK(clk_wiz_0_clk_out1),
        .ARESETN(reset_250),
        .M00_AXIS_ACLK(clk_wiz_0_clk_out1),
        .M00_AXIS_ARESETN(reset_250),
        .M00_AXIS_tdata(axis_interconnect_1_M00_AXIS_TDATA),
        .M00_AXIS_tkeep(axis_interconnect_1_M00_AXIS_TKEEP),
        .M00_AXIS_tlast(axis_interconnect_1_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_interconnect_1_M00_AXIS_TREADY),
        .M00_AXIS_tstrb(axis_interconnect_1_M00_AXIS_TSTRB),
        .M00_AXIS_tvalid(axis_interconnect_1_M00_AXIS_TVALID),
        .S00_ARB_REQ_SUPPRESS(1'b0),
        .S00_AXIS_ACLK(clk_wiz_0_clk_out1),
        .S00_AXIS_ARESETN(reset_250),
        .S00_AXIS_tdata(icmp_m_axis_icmp_TDATA),
        .S00_AXIS_tdest(icmp_m_axis_icmp_TDEST),
        .S00_AXIS_tkeep(icmp_m_axis_icmp_TKEEP),
        .S00_AXIS_tlast(icmp_m_axis_icmp_TLAST),
        .S00_AXIS_tready(icmp_m_axis_icmp_TREADY),
        .S00_AXIS_tstrb(icmp_m_axis_icmp_TSTRB),
        .S00_AXIS_tvalid(icmp_m_axis_icmp_TVALID),
        .S01_ARB_REQ_SUPPRESS(1'b0),
        .S01_AXIS_ACLK(clk_wiz_0_clk_out1),
        .S01_AXIS_ARESETN(reset_250),
        .S01_AXIS_tdata(S01_AXIS_2_TDATA),
        .S01_AXIS_tkeep(S01_AXIS_2_TKEEP),
        .S01_AXIS_tlast(S01_AXIS_2_TLAST),
        .S01_AXIS_tready(S01_AXIS_2_TREADY),
        .S01_AXIS_tvalid(S01_AXIS_2_TVALID));
  network_stack_ethernet_frame_paddi_1_0 ethernet_frame_paddi_1
       (.ap_clk(clk_322),
        .ap_rst_n(proc_sys_reset_0_interconnect_aresetn),
        .m_axis_TDATA(ethernet_frame_paddi_1_m_axis_TDATA),
        .m_axis_TKEEP(ethernet_frame_paddi_1_m_axis_TKEEP),
        .m_axis_TLAST(ethernet_frame_paddi_1_m_axis_TLAST),
        .m_axis_TREADY(ethernet_frame_paddi_1_m_axis_TREADY),
        .m_axis_TSTRB(ethernet_frame_paddi_1_m_axis_TSTRB),
        .m_axis_TVALID(ethernet_frame_paddi_1_m_axis_TVALID),
        .s_axis_TDATA(axis_data_pkt_fifo_1_M_AXIS_TDATA),
        .s_axis_TKEEP(axis_data_pkt_fifo_1_M_AXIS_TKEEP),
        .s_axis_TLAST(axis_data_pkt_fifo_1_M_AXIS_TLAST),
        .s_axis_TREADY(axis_data_pkt_fifo_1_M_AXIS_TREADY),
        .s_axis_TSTRB(axis_data_pkt_fifo_1_M_AXIS_TSTRB),
        .s_axis_TVALID(axis_data_pkt_fifo_1_M_AXIS_TVALID));
  icmp_imp_7BI0FH icmp
       (.clk_250(clk_wiz_0_clk_out1),
        .dout(myIpAddress),
        .m_axis_arp_lookup_rep_tdata(icmp_M_AXIS1_TDATA),
        .m_axis_arp_lookup_rep_tready(icmp_M_AXIS1_TREADY),
        .m_axis_arp_lookup_rep_tvalid(icmp_M_AXIS1_TVALID),
        .m_axis_arp_tdata(S01_AXIS_1_TDATA),
        .m_axis_arp_tkeep(S01_AXIS_1_TKEEP),
        .m_axis_arp_tlast(S01_AXIS_1_TLAST),
        .m_axis_arp_tready(S01_AXIS_1_TREADY),
        .m_axis_arp_tstrb(S01_AXIS_1_TSTRB),
        .m_axis_arp_tvalid(S01_AXIS_1_TVALID),
        .m_axis_icmp_tdata(icmp_m_axis_icmp_TDATA),
        .m_axis_icmp_tdest(icmp_m_axis_icmp_TDEST),
        .m_axis_icmp_tkeep(icmp_m_axis_icmp_TKEEP),
        .m_axis_icmp_tlast(icmp_m_axis_icmp_TLAST),
        .m_axis_icmp_tready(icmp_m_axis_icmp_TREADY),
        .m_axis_icmp_tstrb(icmp_m_axis_icmp_TSTRB),
        .m_axis_icmp_tvalid(icmp_m_axis_icmp_TVALID),
        .myMacAddress(myMacAddress),
        .reset_250(reset_250),
        .s_axis_arp_lookup_req_tdata(mac_ip_encode_0_m_axis_arp_lookup_request_TDATA),
        .s_axis_arp_lookup_req_tready(mac_ip_encode_0_m_axis_arp_lookup_request_TREADY),
        .s_axis_arp_lookup_req_tvalid(mac_ip_encode_0_m_axis_arp_lookup_request_TVALID),
        .s_axis_arp_tdata(ip_handler_0_m_axis_arp_TDATA),
        .s_axis_arp_tkeep(ip_handler_0_m_axis_arp_TKEEP),
        .s_axis_arp_tlast(ip_handler_0_m_axis_arp_TLAST),
        .s_axis_arp_tready(ip_handler_0_m_axis_arp_TREADY),
        .s_axis_arp_tstrb(ip_handler_0_m_axis_arp_TSTRB),
        .s_axis_arp_tvalid(ip_handler_0_m_axis_arp_TVALID),
        .s_axis_icmp_tdata(ip_handler_0_m_axis_icmp_TDATA),
        .s_axis_icmp_tkeep(ip_handler_0_m_axis_icmp_TKEEP),
        .s_axis_icmp_tlast(ip_handler_0_m_axis_icmp_TLAST),
        .s_axis_icmp_tready(ip_handler_0_m_axis_icmp_TREADY),
        .s_axis_icmp_tvalid(ip_handler_0_m_axis_icmp_TVALID));
  network_stack_ip_handler_0_0 ip_handler_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst_n(reset_250),
        .m_axis_arp_TDATA(ip_handler_0_m_axis_arp_TDATA),
        .m_axis_arp_TKEEP(ip_handler_0_m_axis_arp_TKEEP),
        .m_axis_arp_TLAST(ip_handler_0_m_axis_arp_TLAST),
        .m_axis_arp_TREADY(ip_handler_0_m_axis_arp_TREADY),
        .m_axis_arp_TSTRB(ip_handler_0_m_axis_arp_TSTRB),
        .m_axis_arp_TVALID(ip_handler_0_m_axis_arp_TVALID),
        .m_axis_icmp_TDATA(ip_handler_0_m_axis_icmp_TDATA),
        .m_axis_icmp_TKEEP(ip_handler_0_m_axis_icmp_TKEEP),
        .m_axis_icmp_TLAST(ip_handler_0_m_axis_icmp_TLAST),
        .m_axis_icmp_TREADY(ip_handler_0_m_axis_icmp_TREADY),
        .m_axis_icmp_TVALID(ip_handler_0_m_axis_icmp_TVALID),
        .m_axis_icmpv6_TREADY(1'b1),
        .m_axis_ipv6udp_TREADY(1'b1),
        .m_axis_roce_TDATA(ip_handler_0_m_axis_roce_TDATA),
        .m_axis_roce_TKEEP(ip_handler_0_m_axis_roce_TKEEP),
        .m_axis_roce_TLAST(ip_handler_0_m_axis_roce_TLAST),
        .m_axis_roce_TREADY(ip_handler_0_m_axis_roce_TREADY),
        .m_axis_roce_TVALID(ip_handler_0_m_axis_roce_TVALID),
        .m_axis_tcp_TREADY(1'b1),
        .m_axis_udp_TREADY(1'b1),
        .myIpAddress(myIpAddress),
        .s_axis_raw_TDATA(axis_data_rx_cdc_fifo_M_AXIS_TDATA),
        .s_axis_raw_TKEEP(axis_data_rx_cdc_fifo_M_AXIS_TKEEP),
        .s_axis_raw_TLAST(axis_data_rx_cdc_fifo_M_AXIS_TLAST),
        .s_axis_raw_TREADY(axis_data_rx_cdc_fifo_M_AXIS_TREADY),
        .s_axis_raw_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_raw_TVALID(axis_data_rx_cdc_fifo_M_AXIS_TVALID));
  network_stack_mac_ip_encode_0_0 mac_ip_encode_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst_n(reset_250),
        .m_axis_arp_lookup_request_TDATA(mac_ip_encode_0_m_axis_arp_lookup_request_TDATA),
        .m_axis_arp_lookup_request_TREADY(mac_ip_encode_0_m_axis_arp_lookup_request_TREADY),
        .m_axis_arp_lookup_request_TVALID(mac_ip_encode_0_m_axis_arp_lookup_request_TVALID),
        .m_axis_ip_TDATA(mac_ip_encode_0_m_axis_ip_TDATA),
        .m_axis_ip_TKEEP(mac_ip_encode_0_m_axis_ip_TKEEP),
        .m_axis_ip_TLAST(mac_ip_encode_0_m_axis_ip_TLAST),
        .m_axis_ip_TREADY(mac_ip_encode_0_m_axis_ip_TREADY),
        .m_axis_ip_TSTRB(mac_ip_encode_0_m_axis_ip_TSTRB),
        .m_axis_ip_TVALID(mac_ip_encode_0_m_axis_ip_TVALID),
        .myMacAddress({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,myMacAddress}),
        .regDefaultGateway(xlconstant_0_dout),
        .regSubNetMask(xlconstant_7_dout),
        .s_axis_arp_lookup_reply_TDATA(icmp_M_AXIS1_TDATA),
        .s_axis_arp_lookup_reply_TREADY(icmp_M_AXIS1_TREADY),
        .s_axis_arp_lookup_reply_TVALID(icmp_M_AXIS1_TVALID),
        .s_axis_ip_TDATA(axis_interconnect_1_M00_AXIS_TDATA),
        .s_axis_ip_TKEEP(axis_interconnect_1_M00_AXIS_TKEEP),
        .s_axis_ip_TLAST(axis_interconnect_1_M00_AXIS_TLAST),
        .s_axis_ip_TREADY(axis_interconnect_1_M00_AXIS_TREADY),
        .s_axis_ip_TSTRB(axis_interconnect_1_M00_AXIS_TSTRB),
        .s_axis_ip_TVALID(axis_interconnect_1_M00_AXIS_TVALID));
  network_stack_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(xlconstant_8_dout),
        .ext_reset_in(ext_reset_in_322),
        .interconnect_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_322));
  rdma_imp_1GZSFQD rdma
       (.clk_250(clk_wiz_0_clk_out1),
        .local_ip_address(myIpAddress),
        .m_axis_tdata(S01_AXIS_2_TDATA),
        .m_axis_tkeep(S01_AXIS_2_TKEEP),
        .m_axis_tlast(S01_AXIS_2_TLAST),
        .m_axis_tready(S01_AXIS_2_TREADY),
        .m_axis_tvalid(S01_AXIS_2_TVALID),
        .packet_length(stream_generator_0_packet_length),
        .regCrcDropPkgCount(regCrcDropPkgCount_out),
        .regIbvCountRx(regIbvCountRx_out),
        .regIbvCountTx(regIbvCountTx_out),
        .regInvalidPsnDropCount(regInvalidPsnDropCount_out),
        .regRetransCount(regRetransCount_out),
        .reset_250(reset_250),
        .s_ack_tdata(ack_counter_0_m_ack_TDATA),
        .s_ack_tkeep(ack_counter_0_m_ack_TKEEP),
        .s_ack_tlast(ack_counter_0_m_ack_TLAST),
        .s_ack_tready(ack_counter_0_m_ack_TREADY),
        .s_ack_tvalid(ack_counter_0_m_ack_TVALID),
        .s_axis_data_tdata(s_axis_data_tdata),
        .s_axis_data_tuser(s_axis_data_tuser),
        .s_axis_data_tvalid(s_axis_data_tvalid),
        .s_axis_qp_conn_interface_tdata(stream_generator_0_qp_conn_TDATA),
        .s_axis_qp_conn_interface_tready(stream_generator_0_qp_conn_TREADY),
        .s_axis_qp_conn_interface_tvalid(stream_generator_0_qp_conn_TVALID),
        .s_axis_qp_interface_tdata(stream_generator_0_qp_interface_TDATA),
        .s_axis_qp_interface_tready(stream_generator_0_qp_interface_TREADY),
        .s_axis_qp_interface_tvalid(stream_generator_0_qp_interface_TVALID),
        .s_axis_sq_meta_tdata(ack_counter_0_m_req_TDATA),
        .s_axis_sq_meta_tready(ack_counter_0_m_req_TREADY),
        .s_axis_sq_meta_tvalid(ack_counter_0_m_req_TVALID));
  network_stack_sq_meta_iterations_0_0 sq_meta_iterations_0
       (.iterations(stream_generator_0_number_iterations),
        .m_axis_sq_meta_tdata(stream_generator_0_sq_meta1_TDATA),
        .m_axis_sq_meta_tready(stream_generator_0_sq_meta1_TREADY),
        .m_axis_sq_meta_tvalid(stream_generator_0_sq_meta1_TVALID),
        .nclk(clk_wiz_0_clk_out1),
        .nresetn(reset_250),
        .s_axis_sq_meta_tdata(stream_generator_0_sq_meta2_TDATA),
        .s_axis_sq_meta_tkeep(stream_generator_0_sq_meta2_TKEEP),
        .s_axis_sq_meta_tlast(stream_generator_0_sq_meta2_TLAST),
        .s_axis_sq_meta_tready(stream_generator_0_sq_meta2_TREADY),
        .s_axis_sq_meta_tvalid(stream_generator_0_sq_meta2_TVALID));
  network_stack_stream_generator_0_0 stream_generator_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst_n(reset_250),
        .number_iterations(stream_generator_0_number_iterations),
        .packet_length(stream_generator_0_packet_length),
        .qp_conn_TDATA(stream_generator_0_qp_conn_TDATA),
        .qp_conn_TREADY(stream_generator_0_qp_conn_TREADY),
        .qp_conn_TVALID(stream_generator_0_qp_conn_TVALID),
        .qp_interface_TDATA(stream_generator_0_qp_interface_TDATA),
        .qp_interface_TREADY(stream_generator_0_qp_interface_TREADY),
        .qp_interface_TVALID(stream_generator_0_qp_interface_TVALID),
        .s_axi_control_ARADDR(s_axi_control_araddr),
        .s_axi_control_ARREADY(s_axi_control_arready),
        .s_axi_control_ARVALID(s_axi_control_arvalid),
        .s_axi_control_AWADDR(s_axi_control_awaddr),
        .s_axi_control_AWREADY(s_axi_control_awready),
        .s_axi_control_AWVALID(s_axi_control_awvalid),
        .s_axi_control_BREADY(s_axi_control_bready),
        .s_axi_control_BRESP(s_axi_control_bresp),
        .s_axi_control_BVALID(s_axi_control_bvalid),
        .s_axi_control_RDATA(s_axi_control_rdata),
        .s_axi_control_RREADY(s_axi_control_rready),
        .s_axi_control_RRESP(s_axi_control_rresp),
        .s_axi_control_RVALID(s_axi_control_rvalid),
        .s_axi_control_WDATA(s_axi_control_wdata),
        .s_axi_control_WREADY(s_axi_control_wready),
        .s_axi_control_WSTRB(s_axi_control_wstrb),
        .s_axi_control_WVALID(s_axi_control_wvalid),
        .sq_meta_TDATA(stream_generator_0_sq_meta2_TDATA),
        .sq_meta_TKEEP(stream_generator_0_sq_meta2_TKEEP),
        .sq_meta_TLAST(stream_generator_0_sq_meta2_TLAST),
        .sq_meta_TREADY(stream_generator_0_sq_meta2_TREADY),
        .sq_meta_TVALID(stream_generator_0_sq_meta2_TVALID));
  network_stack_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  network_stack_xlconstant_3_0 xlconstant_3
       (.dout(S01_ARB_REQ_SUPPRESS_1));
  network_stack_xlconstant_7_0 xlconstant_7
       (.dout(xlconstant_7_dout));
  network_stack_xlconstant_8_0 xlconstant_8
       (.dout(xlconstant_8_dout));
endmodule

module network_stack_axis_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tkeep,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tstrb,
    M00_AXIS_tvalid,
    S00_ARB_REQ_SUPPRESS,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tkeep,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tstrb,
    S00_AXIS_tvalid,
    S01_ARB_REQ_SUPPRESS,
    S01_AXIS_ACLK,
    S01_AXIS_ARESETN,
    S01_AXIS_tdata,
    S01_AXIS_tkeep,
    S01_AXIS_tlast,
    S01_AXIS_tready,
    S01_AXIS_tstrb,
    S01_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [511:0]M00_AXIS_tdata;
  output [63:0]M00_AXIS_tkeep;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [63:0]M00_AXIS_tstrb;
  output M00_AXIS_tvalid;
  input [31:0]S00_ARB_REQ_SUPPRESS;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [511:0]S00_AXIS_tdata;
  input [63:0]S00_AXIS_tkeep;
  input [0:0]S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [63:0]S00_AXIS_tstrb;
  input S00_AXIS_tvalid;
  input [31:0]S01_ARB_REQ_SUPPRESS;
  input S01_AXIS_ACLK;
  input S01_AXIS_ARESETN;
  input [511:0]S01_AXIS_tdata;
  input [63:0]S01_AXIS_tkeep;
  input [0:0]S01_AXIS_tlast;
  output S01_AXIS_tready;
  input [63:0]S01_AXIS_tstrb;
  input S01_AXIS_tvalid;

  wire ACLK;
  wire ARESETN;
  wire [511:0]M00_AXIS_tdata;
  wire [63:0]M00_AXIS_tkeep;
  wire M00_AXIS_tlast;
  wire M00_AXIS_tready;
  wire [63:0]M00_AXIS_tstrb;
  wire M00_AXIS_tvalid;
  wire [31:0]S00_ARB_REQ_SUPPRESS;
  wire [511:0]S00_AXIS_tdata;
  wire [63:0]S00_AXIS_tkeep;
  wire [0:0]S00_AXIS_tlast;
  wire S00_AXIS_tready;
  wire [63:0]S00_AXIS_tstrb;
  wire S00_AXIS_tvalid;
  wire [31:0]S01_ARB_REQ_SUPPRESS;
  wire [511:0]S01_AXIS_tdata;
  wire [63:0]S01_AXIS_tkeep;
  wire [0:0]S01_AXIS_tlast;
  wire S01_AXIS_tready;
  wire [63:0]S01_AXIS_tstrb;
  wire S01_AXIS_tvalid;
  wire [511:0]s00_couplers_to_xbar_TDATA;
  wire [63:0]s00_couplers_to_xbar_TKEEP;
  wire s00_couplers_to_xbar_TLAST;
  wire [0:0]s00_couplers_to_xbar_TREADY;
  wire [63:0]s00_couplers_to_xbar_TSTRB;
  wire s00_couplers_to_xbar_TVALID;
  wire [511:0]s01_couplers_to_xbar_TDATA;
  wire [63:0]s01_couplers_to_xbar_TKEEP;
  wire s01_couplers_to_xbar_TLAST;
  wire [1:1]s01_couplers_to_xbar_TREADY;
  wire [63:0]s01_couplers_to_xbar_TSTRB;
  wire s01_couplers_to_xbar_TVALID;
  wire [1:0]s_arb_req_suppress_concat_dout;
  wire [511:0]xbar_to_m00_couplers_TDATA;
  wire [63:0]xbar_to_m00_couplers_TKEEP;
  wire [0:0]xbar_to_m00_couplers_TLAST;
  wire xbar_to_m00_couplers_TREADY;
  wire [63:0]xbar_to_m00_couplers_TSTRB;
  wire [0:0]xbar_to_m00_couplers_TVALID;

  m00_couplers_imp_DFB94K m00_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(M00_AXIS_tdata),
        .M_AXIS_tkeep(M00_AXIS_tkeep),
        .M_AXIS_tlast(M00_AXIS_tlast),
        .M_AXIS_tready(M00_AXIS_tready),
        .M_AXIS_tstrb(M00_AXIS_tstrb),
        .M_AXIS_tvalid(M00_AXIS_tvalid),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(xbar_to_m00_couplers_TDATA),
        .S_AXIS_tkeep(xbar_to_m00_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m00_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m00_couplers_TREADY),
        .S_AXIS_tstrb(xbar_to_m00_couplers_TSTRB),
        .S_AXIS_tvalid(xbar_to_m00_couplers_TVALID));
  s00_couplers_imp_D7WUIZ s00_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(s00_couplers_to_xbar_TDATA),
        .M_AXIS_tkeep(s00_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s00_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s00_couplers_to_xbar_TREADY),
        .M_AXIS_tstrb(s00_couplers_to_xbar_TSTRB),
        .M_AXIS_tvalid(s00_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(S00_AXIS_tdata),
        .S_AXIS_tkeep(S00_AXIS_tkeep),
        .S_AXIS_tlast(S00_AXIS_tlast),
        .S_AXIS_tready(S00_AXIS_tready),
        .S_AXIS_tstrb(S00_AXIS_tstrb),
        .S_AXIS_tvalid(S00_AXIS_tvalid));
  s01_couplers_imp_1E6CVA7 s01_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(s01_couplers_to_xbar_TDATA),
        .M_AXIS_tkeep(s01_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s01_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s01_couplers_to_xbar_TREADY),
        .M_AXIS_tstrb(s01_couplers_to_xbar_TSTRB),
        .M_AXIS_tvalid(s01_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(S01_AXIS_tdata),
        .S_AXIS_tkeep(S01_AXIS_tkeep),
        .S_AXIS_tlast(S01_AXIS_tlast),
        .S_AXIS_tready(S01_AXIS_tready),
        .S_AXIS_tstrb(S01_AXIS_tstrb),
        .S_AXIS_tvalid(S01_AXIS_tvalid));
  network_stack_axis_interconnect_0_imp_s_arb_req_suppress_concat_0 s_arb_req_suppress_concat
       (.In0(S00_ARB_REQ_SUPPRESS[0]),
        .In1(S01_ARB_REQ_SUPPRESS[0]),
        .dout(s_arb_req_suppress_concat_dout));
  network_stack_axis_interconnect_0_imp_xbar_0 xbar
       (.aclk(ACLK),
        .aresetn(ARESETN),
        .m_axis_tdata(xbar_to_m00_couplers_TDATA),
        .m_axis_tkeep(xbar_to_m00_couplers_TKEEP),
        .m_axis_tlast(xbar_to_m00_couplers_TLAST),
        .m_axis_tready(xbar_to_m00_couplers_TREADY),
        .m_axis_tstrb(xbar_to_m00_couplers_TSTRB),
        .m_axis_tvalid(xbar_to_m00_couplers_TVALID),
        .s_axis_tdata({s01_couplers_to_xbar_TDATA,s00_couplers_to_xbar_TDATA}),
        .s_axis_tkeep({s01_couplers_to_xbar_TKEEP,s00_couplers_to_xbar_TKEEP}),
        .s_axis_tlast({s01_couplers_to_xbar_TLAST,s00_couplers_to_xbar_TLAST}),
        .s_axis_tready({s01_couplers_to_xbar_TREADY,s00_couplers_to_xbar_TREADY}),
        .s_axis_tstrb({s01_couplers_to_xbar_TSTRB,s00_couplers_to_xbar_TSTRB}),
        .s_axis_tvalid({s01_couplers_to_xbar_TVALID,s00_couplers_to_xbar_TVALID}),
        .s_req_suppress(s_arb_req_suppress_concat_dout));
endmodule

module network_stack_axis_interconnect_1_0
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tkeep,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tstrb,
    M00_AXIS_tvalid,
    S00_ARB_REQ_SUPPRESS,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tdest,
    S00_AXIS_tkeep,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tstrb,
    S00_AXIS_tvalid,
    S01_ARB_REQ_SUPPRESS,
    S01_AXIS_ACLK,
    S01_AXIS_ARESETN,
    S01_AXIS_tdata,
    S01_AXIS_tkeep,
    S01_AXIS_tlast,
    S01_AXIS_tready,
    S01_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [511:0]M00_AXIS_tdata;
  output [63:0]M00_AXIS_tkeep;
  output [0:0]M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [63:0]M00_AXIS_tstrb;
  output M00_AXIS_tvalid;
  input S00_ARB_REQ_SUPPRESS;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [511:0]S00_AXIS_tdata;
  input [0:0]S00_AXIS_tdest;
  input [63:0]S00_AXIS_tkeep;
  input S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [63:0]S00_AXIS_tstrb;
  input S00_AXIS_tvalid;
  input S01_ARB_REQ_SUPPRESS;
  input S01_AXIS_ACLK;
  input S01_AXIS_ARESETN;
  input [511:0]S01_AXIS_tdata;
  input [63:0]S01_AXIS_tkeep;
  input S01_AXIS_tlast;
  output S01_AXIS_tready;
  input S01_AXIS_tvalid;

  wire ACLK;
  wire ARESETN;
  wire [511:0]M00_AXIS_tdata;
  wire [63:0]M00_AXIS_tkeep;
  wire [0:0]M00_AXIS_tlast;
  wire M00_AXIS_tready;
  wire [63:0]M00_AXIS_tstrb;
  wire M00_AXIS_tvalid;
  wire S00_ARB_REQ_SUPPRESS;
  wire [511:0]S00_AXIS_tdata;
  wire [0:0]S00_AXIS_tdest;
  wire [63:0]S00_AXIS_tkeep;
  wire S00_AXIS_tlast;
  wire S00_AXIS_tready;
  wire [63:0]S00_AXIS_tstrb;
  wire S00_AXIS_tvalid;
  wire S01_ARB_REQ_SUPPRESS;
  wire [511:0]S01_AXIS_tdata;
  wire [63:0]S01_AXIS_tkeep;
  wire S01_AXIS_tlast;
  wire S01_AXIS_tready;
  wire S01_AXIS_tvalid;
  wire [511:0]s00_couplers_to_xbar_TDATA;
  wire [0:0]s00_couplers_to_xbar_TDEST;
  wire [63:0]s00_couplers_to_xbar_TKEEP;
  wire s00_couplers_to_xbar_TLAST;
  wire [0:0]s00_couplers_to_xbar_TREADY;
  wire [63:0]s00_couplers_to_xbar_TSTRB;
  wire s00_couplers_to_xbar_TVALID;
  wire [511:0]s01_couplers_to_xbar_TDATA;
  wire [63:0]s01_couplers_to_xbar_TKEEP;
  wire s01_couplers_to_xbar_TLAST;
  wire [1:1]s01_couplers_to_xbar_TREADY;
  wire s01_couplers_to_xbar_TVALID;
  wire [1:0]s_arb_req_suppress_concat_dout;
  wire [511:0]xbar_to_m00_couplers_TDATA;
  wire [0:0]xbar_to_m00_couplers_TDEST;
  wire [63:0]xbar_to_m00_couplers_TKEEP;
  wire [0:0]xbar_to_m00_couplers_TLAST;
  wire xbar_to_m00_couplers_TREADY;
  wire [63:0]xbar_to_m00_couplers_TSTRB;
  wire [0:0]xbar_to_m00_couplers_TVALID;

  m00_couplers_imp_QC9D4L m00_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(M00_AXIS_tdata),
        .M_AXIS_tkeep(M00_AXIS_tkeep),
        .M_AXIS_tlast(M00_AXIS_tlast),
        .M_AXIS_tready(M00_AXIS_tready),
        .M_AXIS_tstrb(M00_AXIS_tstrb),
        .M_AXIS_tvalid(M00_AXIS_tvalid),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(xbar_to_m00_couplers_TDATA),
        .S_AXIS_tdest(xbar_to_m00_couplers_TDEST),
        .S_AXIS_tkeep(xbar_to_m00_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m00_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m00_couplers_TREADY),
        .S_AXIS_tstrb(xbar_to_m00_couplers_TSTRB),
        .S_AXIS_tvalid(xbar_to_m00_couplers_TVALID));
  s00_couplers_imp_I2V8I2 s00_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(s00_couplers_to_xbar_TDATA),
        .M_AXIS_tdest(s00_couplers_to_xbar_TDEST),
        .M_AXIS_tkeep(s00_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s00_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s00_couplers_to_xbar_TREADY),
        .M_AXIS_tstrb(s00_couplers_to_xbar_TSTRB),
        .M_AXIS_tvalid(s00_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(S00_AXIS_tdata),
        .S_AXIS_tdest(S00_AXIS_tdest),
        .S_AXIS_tkeep(S00_AXIS_tkeep),
        .S_AXIS_tlast(S00_AXIS_tlast),
        .S_AXIS_tready(S00_AXIS_tready),
        .S_AXIS_tstrb(S00_AXIS_tstrb),
        .S_AXIS_tvalid(S00_AXIS_tvalid));
  s01_couplers_imp_1OL376M s01_couplers
       (.M_AXIS_ACLK(ACLK),
        .M_AXIS_ARESETN(ARESETN),
        .M_AXIS_tdata(s01_couplers_to_xbar_TDATA),
        .M_AXIS_tkeep(s01_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s01_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s01_couplers_to_xbar_TREADY),
        .M_AXIS_tvalid(s01_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(ACLK),
        .S_AXIS_ARESETN(ARESETN),
        .S_AXIS_tdata(S01_AXIS_tdata),
        .S_AXIS_tkeep(S01_AXIS_tkeep),
        .S_AXIS_tlast(S01_AXIS_tlast),
        .S_AXIS_tready(S01_AXIS_tready),
        .S_AXIS_tvalid(S01_AXIS_tvalid));
  network_stack_axis_interconnect_1_imp_s_arb_req_suppress_concat_0 s_arb_req_suppress_concat
       (.In0(S00_ARB_REQ_SUPPRESS),
        .In1(S01_ARB_REQ_SUPPRESS),
        .dout(s_arb_req_suppress_concat_dout));
  network_stack_axis_interconnect_1_imp_xbar_0 xbar
       (.aclk(ACLK),
        .aresetn(ARESETN),
        .m_axis_tdata(xbar_to_m00_couplers_TDATA),
        .m_axis_tdest(xbar_to_m00_couplers_TDEST),
        .m_axis_tkeep(xbar_to_m00_couplers_TKEEP),
        .m_axis_tlast(xbar_to_m00_couplers_TLAST),
        .m_axis_tready(xbar_to_m00_couplers_TREADY),
        .m_axis_tstrb(xbar_to_m00_couplers_TSTRB),
        .m_axis_tvalid(xbar_to_m00_couplers_TVALID),
        .s_axis_tdata({s01_couplers_to_xbar_TDATA,s00_couplers_to_xbar_TDATA}),
        .s_axis_tdest({1'b0,s00_couplers_to_xbar_TDEST}),
        .s_axis_tkeep({s01_couplers_to_xbar_TKEEP,s00_couplers_to_xbar_TKEEP}),
        .s_axis_tlast({s01_couplers_to_xbar_TLAST,s00_couplers_to_xbar_TLAST}),
        .s_axis_tready({s01_couplers_to_xbar_TREADY,s00_couplers_to_xbar_TREADY}),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,s00_couplers_to_xbar_TSTRB}),
        .s_axis_tvalid({s01_couplers_to_xbar_TVALID,s00_couplers_to_xbar_TVALID}),
        .s_req_suppress(s_arb_req_suppress_concat_dout));
endmodule

module rdma_imp_1GZSFQD
   (clk_250,
    local_ip_address,
    m_axis_ila_tdata,
    m_axis_ila_tlast,
    m_axis_ila_tvalid,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tvalid,
    packet_length,
    regCrcDropPkgCount,
    regIbvCountRx,
    regIbvCountTx,
    regInvalidPsnDropCount,
    regRetransCount,
    reset_250,
    s_ack_tdata,
    s_ack_tkeep,
    s_ack_tlast,
    s_ack_tready,
    s_ack_tvalid,
    s_axis_data_tdata,
    s_axis_data_tuser,
    s_axis_data_tvalid,
    s_axis_qp_conn_interface_tdata,
    s_axis_qp_conn_interface_tready,
    s_axis_qp_conn_interface_tvalid,
    s_axis_qp_interface_tdata,
    s_axis_qp_interface_tready,
    s_axis_qp_interface_tvalid,
    s_axis_sq_meta_tdata,
    s_axis_sq_meta_tready,
    s_axis_sq_meta_tvalid);
  input clk_250;
  input [31:0]local_ip_address;
  output m_axis_ila_tdata;
  output m_axis_ila_tlast;
  output m_axis_ila_tvalid;
  output [511:0]m_axis_tdata;
  output [63:0]m_axis_tkeep;
  output m_axis_tlast;
  input m_axis_tready;
  output m_axis_tvalid;
  input [15:0]packet_length;
  output [31:0]regCrcDropPkgCount;
  output [31:0]regIbvCountRx;
  output [31:0]regIbvCountTx;
  output [31:0]regInvalidPsnDropCount;
  output [31:0]regRetransCount;
  input reset_250;
  input [511:0]s_ack_tdata;
  input [63:0]s_ack_tkeep;
  input s_ack_tlast;
  output s_ack_tready;
  input s_ack_tvalid;
  input [1023:0]s_axis_data_tdata;
  input [3:0]s_axis_data_tuser;
  input s_axis_data_tvalid;
  input [183:0]s_axis_qp_conn_interface_tdata;
  output s_axis_qp_conn_interface_tready;
  input s_axis_qp_conn_interface_tvalid;
  input [183:0]s_axis_qp_interface_tdata;
  output s_axis_qp_interface_tready;
  input s_axis_qp_interface_tvalid;
  input [247:0]s_axis_sq_meta_tdata;
  output s_axis_sq_meta_tready;
  input s_axis_sq_meta_tvalid;

  wire [511:0]BRAM_buffer_wrapper_0_m_axis_ddr_TDATA;
  wire [63:0]BRAM_buffer_wrapper_0_m_axis_ddr_TKEEP;
  wire BRAM_buffer_wrapper_0_m_axis_ddr_TLAST;
  wire BRAM_buffer_wrapper_0_m_axis_ddr_TREADY;
  wire BRAM_buffer_wrapper_0_m_axis_ddr_TVALID;
  wire [511:0]ack_gap_enforcer_wra_0_m_axis_TDATA;
  wire [63:0]ack_gap_enforcer_wra_0_m_axis_TKEEP;
  wire ack_gap_enforcer_wra_0_m_axis_TLAST;
  wire ack_gap_enforcer_wra_0_m_axis_TREADY;
  wire ack_gap_enforcer_wra_0_m_axis_TVALID;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire ap_clk_1;
  wire [511:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire [63:0]axis_data_fifo_0_M_AXIS_TKEEP;
  wire axis_data_fifo_0_M_AXIS_TLAST;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [1023:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TLAST;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire axis_data_fifo_1_prog_empty;
  wire [511:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  wire axis_dwidth_converter_0_M_AXIS_TLAST;
  wire axis_dwidth_converter_0_M_AXIS_TREADY;
  wire axis_dwidth_converter_0_M_AXIS_TVALID;
  wire [0:0]constant_1_dout;
  wire [31:0]local_ip_address;
  wire [1023:0]\^m_axis_ila_tdata ;
  wire m_axis_ila_tlast;
  wire m_axis_ila_tvalid;
  wire [511:0]m_axis_tdata;
  wire [63:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [511:0]mux_retrans_dummydata_0_m_axis_user_req_TDATA;
  wire [63:0]mux_retrans_dummydata_0_m_axis_user_req_TKEEP;
  wire mux_retrans_dummydata_0_m_axis_user_req_TLAST;
  wire mux_retrans_dummydata_0_m_axis_user_req_TREADY;
  wire mux_retrans_dummydata_0_m_axis_user_req_TVALID;
  wire [15:0]packet_length;
  wire [247:0]rdma_flow_wrapper_0_m_req_TDATA;
  wire rdma_flow_wrapper_0_m_req_TREADY;
  wire rdma_flow_wrapper_0_m_req_TVALID;
  wire [511:0]rdma_mux_retrans_wra_0_m_axis_ddr_TDATA;
  wire [63:0]rdma_mux_retrans_wra_0_m_axis_ddr_TKEEP;
  wire rdma_mux_retrans_wra_0_m_axis_ddr_TLAST;
  wire rdma_mux_retrans_wra_0_m_axis_ddr_TREADY;
  wire rdma_mux_retrans_wra_0_m_axis_ddr_TVALID;
  wire [511:0]rdma_mux_retrans_wra_0_m_axis_net_TDATA;
  wire [63:0]rdma_mux_retrans_wra_0_m_axis_net_TKEEP;
  wire rdma_mux_retrans_wra_0_m_axis_net_TLAST;
  wire rdma_mux_retrans_wra_0_m_axis_net_TREADY;
  wire rdma_mux_retrans_wra_0_m_axis_net_TVALID;
  wire [95:0]rdma_mux_retrans_wra_0_m_req_ddr_rd_TDATA;
  wire rdma_mux_retrans_wra_0_m_req_ddr_rd_TREADY;
  wire rdma_mux_retrans_wra_0_m_req_ddr_rd_TVALID;
  wire [95:0]rdma_mux_retrans_wra_0_m_req_ddr_wr_TDATA;
  wire rdma_mux_retrans_wra_0_m_req_ddr_wr_TREADY;
  wire rdma_mux_retrans_wra_0_m_req_ddr_wr_TVALID;
  wire [511:0]read_request_trimmer_1_m_axis_TDATA;
  wire [63:0]read_request_trimmer_1_m_axis_TKEEP;
  wire read_request_trimmer_1_m_axis_TLAST;
  wire read_request_trimmer_1_m_axis_TREADY;
  wire read_request_trimmer_1_m_axis_TVALID;
  wire [31:0]regCrcDropPkgCount;
  wire [31:0]regIbvCountRx;
  wire [31:0]regIbvCountTx;
  wire [31:0]regInvalidPsnDropCount;
  wire [31:0]regRetransCount;
  wire reset_250;
  wire [143:0]rocev2_0_m_axis_mem_read_cmd1_TDATA;
  wire rocev2_0_m_axis_mem_read_cmd1_TREADY;
  wire rocev2_0_m_axis_mem_read_cmd1_TVALID;
  wire [63:0]rocev2_0_m_axis_rx_ack_meta_TDATA;
  wire rocev2_0_m_axis_rx_ack_meta_TREADY;
  wire rocev2_0_m_axis_rx_ack_meta_TVALID;
  wire [511:0]rocev2_0_m_axis_tx_data_TDATA;
  wire [63:0]rocev2_0_m_axis_tx_data_TKEEP;
  wire [0:0]rocev2_0_m_axis_tx_data_TLAST;
  wire rocev2_0_m_axis_tx_data_TREADY;
  wire rocev2_0_m_axis_tx_data_TVALID;
  wire [511:0]s_ack_tdata;
  wire [63:0]s_ack_tkeep;
  wire s_ack_tlast;
  wire s_ack_tready;
  wire s_ack_tvalid;
  wire [1023:0]s_axis_data_tdata;
  wire [3:0]s_axis_data_tuser;
  wire s_axis_data_tvalid;
  wire [183:0]s_axis_qp_conn_interface_tdata;
  wire s_axis_qp_conn_interface_tready;
  wire s_axis_qp_conn_interface_tvalid;
  wire [183:0]s_axis_qp_interface_tdata;
  wire s_axis_qp_interface_tready;
  wire s_axis_qp_interface_tvalid;
  wire [247:0]s_axis_sq_meta_tdata;
  wire s_axis_sq_meta_tready;
  wire s_axis_sq_meta_tvalid;
  wire [127:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;

  assign ap_clk_1 = clk_250;
  assign m_axis_ila_tdata = \^m_axis_ila_tdata [0];
  network_stack_BRAM_buffer_wrapper_0_0 BRAM_buffer_wrapper_0
       (.m_axis_ddr_tdata(BRAM_buffer_wrapper_0_m_axis_ddr_TDATA),
        .m_axis_ddr_tkeep(BRAM_buffer_wrapper_0_m_axis_ddr_TKEEP),
        .m_axis_ddr_tlast(BRAM_buffer_wrapper_0_m_axis_ddr_TLAST),
        .m_axis_ddr_tready(BRAM_buffer_wrapper_0_m_axis_ddr_TREADY),
        .m_axis_ddr_tvalid(BRAM_buffer_wrapper_0_m_axis_ddr_TVALID),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .packet_length(packet_length),
        .s_axis_ddr_tdata(rdma_mux_retrans_wra_0_m_axis_ddr_TDATA),
        .s_axis_ddr_tkeep(rdma_mux_retrans_wra_0_m_axis_ddr_TKEEP),
        .s_axis_ddr_tlast(rdma_mux_retrans_wra_0_m_axis_ddr_TLAST),
        .s_axis_ddr_tready(rdma_mux_retrans_wra_0_m_axis_ddr_TREADY),
        .s_axis_ddr_tvalid(rdma_mux_retrans_wra_0_m_axis_ddr_TVALID),
        .s_req_ddr_rd_tdata(rdma_mux_retrans_wra_0_m_req_ddr_rd_TDATA),
        .s_req_ddr_rd_tready(rdma_mux_retrans_wra_0_m_req_ddr_rd_TREADY),
        .s_req_ddr_rd_tvalid(rdma_mux_retrans_wra_0_m_req_ddr_rd_TVALID),
        .s_req_ddr_wr_tdata(rdma_mux_retrans_wra_0_m_req_ddr_wr_TDATA),
        .s_req_ddr_wr_tready(rdma_mux_retrans_wra_0_m_req_ddr_wr_TREADY),
        .s_req_ddr_wr_tvalid(rdma_mux_retrans_wra_0_m_req_ddr_wr_TVALID));
  network_stack_ack_gap_enforcer_wra_0_0 ack_gap_enforcer_wra_0
       (.m_axis_tdata(ack_gap_enforcer_wra_0_m_axis_TDATA),
        .m_axis_tkeep(ack_gap_enforcer_wra_0_m_axis_TKEEP),
        .m_axis_tlast(ack_gap_enforcer_wra_0_m_axis_TLAST),
        .m_axis_tready(ack_gap_enforcer_wra_0_m_axis_TREADY),
        .m_axis_tvalid(ack_gap_enforcer_wra_0_m_axis_TVALID),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tkeep(axis_data_fifo_0_M_AXIS_TKEEP),
        .s_axis_tlast(axis_data_fifo_0_M_AXIS_TLAST),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  network_stack_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_fifo_0_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_fifo_0_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(reset_250),
        .s_axis_tdata(s_ack_tdata),
        .s_axis_tkeep(s_ack_tkeep),
        .s_axis_tlast(s_ack_tlast),
        .s_axis_tready(s_ack_tready),
        .s_axis_tvalid(s_ack_tvalid));
  network_stack_axis_data_fifo_1_0 axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tlast(axis_data_fifo_1_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .prog_empty(axis_data_fifo_1_prog_empty),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(reset_250),
        .s_axis_tdata(\^m_axis_ila_tdata ),
        .s_axis_tlast(m_axis_ila_tlast),
        .s_axis_tvalid(m_axis_ila_tvalid));
  network_stack_axis_dwidth_converter_0_1 axis_dwidth_converter_0
       (.aclk(ap_clk_1),
        .aresetn(reset_250),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tlast(axis_dwidth_converter_0_M_AXIS_TLAST),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .s_axis_tlast(axis_data_fifo_1_M_AXIS_TLAST),
        .s_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID));
  network_stack_axis_windowing_wrapp_0_0 axis_windowing_wrapp_0
       (.aclk(ap_clk_1),
        .aresetn(reset_250),
        .irq_async_i(axis_data_fifo_1_prog_empty),
        .m_axis_tdata_o(\^m_axis_ila_tdata ),
        .m_axis_tlast_o(m_axis_ila_tlast),
        .m_axis_tvalid_o(m_axis_ila_tvalid),
        .s_axis_tdata_i(s_axis_data_tdata),
        .s_axis_tuser_i(s_axis_data_tuser),
        .s_axis_tvalid_i(s_axis_data_tvalid));
  network_stack_constant_1_0 constant_1
       (.dout(constant_1_dout));
  network_stack_constant_tie_off_0 constant_tie_off
       (.dout(xlconstant_0_dout));
  network_stack_icrc_wrapper_0_0 icrc_wrapper_0
       (.m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .nclk(ap_clk_1),
        .nreset(reset_250),
        .s_axis_tdata(read_request_trimmer_1_m_axis_TDATA),
        .s_axis_tkeep(read_request_trimmer_1_m_axis_TKEEP),
        .s_axis_tlast(read_request_trimmer_1_m_axis_TLAST),
        .s_axis_tready(read_request_trimmer_1_m_axis_TREADY),
        .s_axis_tvalid(read_request_trimmer_1_m_axis_TVALID));
  network_stack_insert_tlast_0_0 insert_tlast_0
       (.m_axis_tdata(mux_retrans_dummydata_0_m_axis_user_req_TDATA),
        .m_axis_tkeep(mux_retrans_dummydata_0_m_axis_user_req_TKEEP),
        .m_axis_tlast(mux_retrans_dummydata_0_m_axis_user_req_TLAST),
        .m_axis_tready(mux_retrans_dummydata_0_m_axis_user_req_TREADY),
        .m_axis_tvalid(mux_retrans_dummydata_0_m_axis_user_req_TVALID),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .packet_length(packet_length),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(axis_dwidth_converter_0_M_AXIS_TLAST),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID));
  network_stack_rdma_flow_wrapper_0_0 rdma_flow_wrapper_0
       (.m_ack_tready(1'b1),
        .m_req_tdata(rdma_flow_wrapper_0_m_req_TDATA),
        .m_req_tready(rdma_flow_wrapper_0_m_req_TREADY),
        .m_req_tvalid(rdma_flow_wrapper_0_m_req_TVALID),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .s_ack_tdata(rocev2_0_m_axis_rx_ack_meta_TDATA),
        .s_ack_tready(rocev2_0_m_axis_rx_ack_meta_TREADY),
        .s_ack_tvalid(rocev2_0_m_axis_rx_ack_meta_TVALID),
        .s_req_tdata(s_axis_sq_meta_tdata),
        .s_req_tready(s_axis_sq_meta_tready),
        .s_req_tvalid(s_axis_sq_meta_tvalid));
  network_stack_rdma_mux_retrans_wra_0_0 rdma_mux_retrans_wra_0
       (.m_axis_ddr_tdata(rdma_mux_retrans_wra_0_m_axis_ddr_TDATA),
        .m_axis_ddr_tkeep(rdma_mux_retrans_wra_0_m_axis_ddr_TKEEP),
        .m_axis_ddr_tlast(rdma_mux_retrans_wra_0_m_axis_ddr_TLAST),
        .m_axis_ddr_tready(rdma_mux_retrans_wra_0_m_axis_ddr_TREADY),
        .m_axis_ddr_tvalid(rdma_mux_retrans_wra_0_m_axis_ddr_TVALID),
        .m_axis_net_tdata(rdma_mux_retrans_wra_0_m_axis_net_TDATA),
        .m_axis_net_tkeep(rdma_mux_retrans_wra_0_m_axis_net_TKEEP),
        .m_axis_net_tlast(rdma_mux_retrans_wra_0_m_axis_net_TLAST),
        .m_axis_net_tready(rdma_mux_retrans_wra_0_m_axis_net_TREADY),
        .m_axis_net_tvalid(rdma_mux_retrans_wra_0_m_axis_net_TVALID),
        .m_req_ddr_rd_tdata(rdma_mux_retrans_wra_0_m_req_ddr_rd_TDATA),
        .m_req_ddr_rd_tready(rdma_mux_retrans_wra_0_m_req_ddr_rd_TREADY),
        .m_req_ddr_rd_tvalid(rdma_mux_retrans_wra_0_m_req_ddr_rd_TVALID),
        .m_req_ddr_wr_tdata(rdma_mux_retrans_wra_0_m_req_ddr_wr_TDATA),
        .m_req_ddr_wr_tready(rdma_mux_retrans_wra_0_m_req_ddr_wr_TREADY),
        .m_req_ddr_wr_tvalid(rdma_mux_retrans_wra_0_m_req_ddr_wr_TVALID),
        .m_req_user_tready(1'b1),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .s_axis_ddr_tdata(BRAM_buffer_wrapper_0_m_axis_ddr_TDATA),
        .s_axis_ddr_tkeep(BRAM_buffer_wrapper_0_m_axis_ddr_TKEEP),
        .s_axis_ddr_tlast(BRAM_buffer_wrapper_0_m_axis_ddr_TLAST),
        .s_axis_ddr_tready(BRAM_buffer_wrapper_0_m_axis_ddr_TREADY),
        .s_axis_ddr_tvalid(BRAM_buffer_wrapper_0_m_axis_ddr_TVALID),
        .s_axis_user_req_tdata(mux_retrans_dummydata_0_m_axis_user_req_TDATA),
        .s_axis_user_req_tkeep(mux_retrans_dummydata_0_m_axis_user_req_TKEEP),
        .s_axis_user_req_tlast(mux_retrans_dummydata_0_m_axis_user_req_TLAST),
        .s_axis_user_req_tready(mux_retrans_dummydata_0_m_axis_user_req_TREADY),
        .s_axis_user_req_tvalid(mux_retrans_dummydata_0_m_axis_user_req_TVALID),
        .s_axis_user_rsp_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_user_rsp_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_user_rsp_tlast(1'b0),
        .s_axis_user_rsp_tvalid(xlconstant_0_dout),
        .s_req_net_tdata(rocev2_0_m_axis_mem_read_cmd1_TDATA),
        .s_req_net_tready(rocev2_0_m_axis_mem_read_cmd1_TREADY),
        .s_req_net_tvalid(rocev2_0_m_axis_mem_read_cmd1_TVALID));
  network_stack_read_request_trimmer_1_0 read_request_trimmer_1
       (.m_axis_tdata(read_request_trimmer_1_m_axis_TDATA),
        .m_axis_tkeep(read_request_trimmer_1_m_axis_TKEEP),
        .m_axis_tlast(read_request_trimmer_1_m_axis_TLAST),
        .m_axis_tready(read_request_trimmer_1_m_axis_TREADY),
        .m_axis_tvalid(read_request_trimmer_1_m_axis_TVALID),
        .nclk(ap_clk_1),
        .nresetn(reset_250),
        .s_axis_tdata(rocev2_0_m_axis_tx_data_TDATA),
        .s_axis_tkeep(rocev2_0_m_axis_tx_data_TKEEP),
        .s_axis_tlast(rocev2_0_m_axis_tx_data_TLAST),
        .s_axis_tready(rocev2_0_m_axis_tx_data_TREADY),
        .s_axis_tvalid(rocev2_0_m_axis_tx_data_TVALID));
  network_stack_rocev2_0_0 rocev2_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(reset_250),
        .local_ip_address(xlconcat_0_dout),
        .m_axis_mem_read_cmd_TDATA(rocev2_0_m_axis_mem_read_cmd1_TDATA),
        .m_axis_mem_read_cmd_TREADY(rocev2_0_m_axis_mem_read_cmd1_TREADY),
        .m_axis_mem_read_cmd_TVALID(rocev2_0_m_axis_mem_read_cmd1_TVALID),
        .m_axis_mem_write_cmd_TREADY(constant_1_dout),
        .m_axis_mem_write_data_TREADY(constant_1_dout),
        .m_axis_rx_ack_meta_TDATA(rocev2_0_m_axis_rx_ack_meta_TDATA),
        .m_axis_rx_ack_meta_TREADY(rocev2_0_m_axis_rx_ack_meta_TREADY),
        .m_axis_rx_ack_meta_TVALID(rocev2_0_m_axis_rx_ack_meta_TVALID),
        .m_axis_tx_data_TDATA(rocev2_0_m_axis_tx_data_TDATA),
        .m_axis_tx_data_TKEEP(rocev2_0_m_axis_tx_data_TKEEP),
        .m_axis_tx_data_TLAST(rocev2_0_m_axis_tx_data_TLAST),
        .m_axis_tx_data_TREADY(rocev2_0_m_axis_tx_data_TREADY),
        .m_axis_tx_data_TVALID(rocev2_0_m_axis_tx_data_TVALID),
        .regCrcDropPkgCount(regCrcDropPkgCount),
        .regIbvCountRx(regIbvCountRx),
        .regIbvCountTx(regIbvCountTx),
        .regInvalidPsnDropCount(regInvalidPsnDropCount),
        .regRetransCount(regRetransCount),
        .s_axis_mem_read_data_TDATA(rdma_mux_retrans_wra_0_m_axis_net_TDATA),
        .s_axis_mem_read_data_TKEEP(rdma_mux_retrans_wra_0_m_axis_net_TKEEP),
        .s_axis_mem_read_data_TLAST(rdma_mux_retrans_wra_0_m_axis_net_TLAST),
        .s_axis_mem_read_data_TREADY(rdma_mux_retrans_wra_0_m_axis_net_TREADY),
        .s_axis_mem_read_data_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_mem_read_data_TVALID(rdma_mux_retrans_wra_0_m_axis_net_TVALID),
        .s_axis_qp_conn_interface_TDATA(s_axis_qp_conn_interface_tdata),
        .s_axis_qp_conn_interface_TREADY(s_axis_qp_conn_interface_tready),
        .s_axis_qp_conn_interface_TVALID(s_axis_qp_conn_interface_tvalid),
        .s_axis_qp_interface_TDATA(s_axis_qp_interface_tdata),
        .s_axis_qp_interface_TREADY(s_axis_qp_interface_tready),
        .s_axis_qp_interface_TVALID(s_axis_qp_interface_tvalid),
        .s_axis_rx_data_TDATA(ack_gap_enforcer_wra_0_m_axis_TDATA),
        .s_axis_rx_data_TKEEP(ack_gap_enforcer_wra_0_m_axis_TKEEP),
        .s_axis_rx_data_TLAST(ack_gap_enforcer_wra_0_m_axis_TLAST),
        .s_axis_rx_data_TREADY(ack_gap_enforcer_wra_0_m_axis_TREADY),
        .s_axis_rx_data_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_rx_data_TVALID(ack_gap_enforcer_wra_0_m_axis_TVALID),
        .s_axis_sq_meta_TDATA(rdma_flow_wrapper_0_m_req_TDATA),
        .s_axis_sq_meta_TREADY(rdma_flow_wrapper_0_m_req_TREADY),
        .s_axis_sq_meta_TVALID(rdma_flow_wrapper_0_m_req_TVALID));
  network_stack_xlconcat_0_0 xlconcat_0
       (.In0(local_ip_address),
        .In1(local_ip_address),
        .In2(local_ip_address),
        .In3(local_ip_address),
        .dout(xlconcat_0_dout));
endmodule

module s00_couplers_imp_D7WUIZ
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tstrb;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [63:0]S_AXIS_tkeep;
  input [0:0]S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tstrb;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire [63:0]M_AXIS_tstrb;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire [0:0]S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [63:0]S_AXIS_tstrb;
  wire S_AXIS_tvalid;
  wire [511:0]s00_regslice_to_s00_data_fifo_TDATA;
  wire [63:0]s00_regslice_to_s00_data_fifo_TKEEP;
  wire s00_regslice_to_s00_data_fifo_TLAST;
  wire s00_regslice_to_s00_data_fifo_TREADY;
  wire [63:0]s00_regslice_to_s00_data_fifo_TSTRB;
  wire s00_regslice_to_s00_data_fifo_TVALID;

  network_stack_axis_interconnect_0_imp_s00_data_fifo_0 s00_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(M_AXIS_tlast),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tstrb(M_AXIS_tstrb),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_aclk(M_AXIS_ACLK),
        .s_axis_aresetn(M_AXIS_ARESETN),
        .s_axis_tdata(s00_regslice_to_s00_data_fifo_TDATA),
        .s_axis_tkeep(s00_regslice_to_s00_data_fifo_TKEEP),
        .s_axis_tlast(s00_regslice_to_s00_data_fifo_TLAST),
        .s_axis_tready(s00_regslice_to_s00_data_fifo_TREADY),
        .s_axis_tstrb(s00_regslice_to_s00_data_fifo_TSTRB),
        .s_axis_tvalid(s00_regslice_to_s00_data_fifo_TVALID));
  network_stack_axis_interconnect_0_imp_s00_regslice_0 s00_regslice
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(s00_regslice_to_s00_data_fifo_TDATA),
        .m_axis_tkeep(s00_regslice_to_s00_data_fifo_TKEEP),
        .m_axis_tlast(s00_regslice_to_s00_data_fifo_TLAST),
        .m_axis_tready(s00_regslice_to_s00_data_fifo_TREADY),
        .m_axis_tstrb(s00_regslice_to_s00_data_fifo_TSTRB),
        .m_axis_tvalid(s00_regslice_to_s00_data_fifo_TVALID),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tstrb(S_AXIS_tstrb),
        .s_axis_tvalid(S_AXIS_tvalid));
endmodule

module s00_couplers_imp_I2V8I2
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tdest,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [0:0]M_AXIS_tdest;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tstrb;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [0:0]S_AXIS_tdest;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tstrb;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [0:0]M_AXIS_tdest;
  wire [63:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire [63:0]M_AXIS_tstrb;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [0:0]S_AXIS_tdest;
  wire [63:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [63:0]S_AXIS_tstrb;
  wire S_AXIS_tvalid;
  wire [511:0]auto_ss_slid_to_s00_data_fifo_TDATA;
  wire [0:0]auto_ss_slid_to_s00_data_fifo_TDEST;
  wire [63:0]auto_ss_slid_to_s00_data_fifo_TKEEP;
  wire auto_ss_slid_to_s00_data_fifo_TLAST;
  wire auto_ss_slid_to_s00_data_fifo_TREADY;
  wire [63:0]auto_ss_slid_to_s00_data_fifo_TSTRB;
  wire auto_ss_slid_to_s00_data_fifo_TVALID;
  wire [511:0]s00_regslice_to_auto_ss_slid_TDATA;
  wire [0:0]s00_regslice_to_auto_ss_slid_TDEST;
  wire [63:0]s00_regslice_to_auto_ss_slid_TKEEP;
  wire s00_regslice_to_auto_ss_slid_TLAST;
  wire s00_regslice_to_auto_ss_slid_TREADY;
  wire [63:0]s00_regslice_to_auto_ss_slid_TSTRB;
  wire s00_regslice_to_auto_ss_slid_TVALID;

  network_stack_axis_interconnect_1_imp_auto_ss_slid_0 auto_ss_slid
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(auto_ss_slid_to_s00_data_fifo_TDATA),
        .m_axis_tdest(auto_ss_slid_to_s00_data_fifo_TDEST),
        .m_axis_tkeep(auto_ss_slid_to_s00_data_fifo_TKEEP),
        .m_axis_tlast(auto_ss_slid_to_s00_data_fifo_TLAST),
        .m_axis_tready(auto_ss_slid_to_s00_data_fifo_TREADY),
        .m_axis_tstrb(auto_ss_slid_to_s00_data_fifo_TSTRB),
        .m_axis_tvalid(auto_ss_slid_to_s00_data_fifo_TVALID),
        .s_axis_tdata(s00_regslice_to_auto_ss_slid_TDATA),
        .s_axis_tdest(s00_regslice_to_auto_ss_slid_TDEST),
        .s_axis_tkeep(s00_regslice_to_auto_ss_slid_TKEEP),
        .s_axis_tlast(s00_regslice_to_auto_ss_slid_TLAST),
        .s_axis_tready(s00_regslice_to_auto_ss_slid_TREADY),
        .s_axis_tstrb(s00_regslice_to_auto_ss_slid_TSTRB),
        .s_axis_tvalid(s00_regslice_to_auto_ss_slid_TVALID));
  network_stack_axis_interconnect_1_imp_s00_data_fifo_0 s00_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tdest(M_AXIS_tdest),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(M_AXIS_tlast),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tstrb(M_AXIS_tstrb),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_aclk(M_AXIS_ACLK),
        .s_axis_aresetn(M_AXIS_ARESETN),
        .s_axis_tdata(auto_ss_slid_to_s00_data_fifo_TDATA),
        .s_axis_tdest(auto_ss_slid_to_s00_data_fifo_TDEST),
        .s_axis_tkeep(auto_ss_slid_to_s00_data_fifo_TKEEP),
        .s_axis_tlast(auto_ss_slid_to_s00_data_fifo_TLAST),
        .s_axis_tready(auto_ss_slid_to_s00_data_fifo_TREADY),
        .s_axis_tstrb(auto_ss_slid_to_s00_data_fifo_TSTRB),
        .s_axis_tvalid(auto_ss_slid_to_s00_data_fifo_TVALID));
  network_stack_axis_interconnect_1_imp_s00_regslice_0 s00_regslice
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(s00_regslice_to_auto_ss_slid_TDATA),
        .m_axis_tdest(s00_regslice_to_auto_ss_slid_TDEST),
        .m_axis_tkeep(s00_regslice_to_auto_ss_slid_TKEEP),
        .m_axis_tlast(s00_regslice_to_auto_ss_slid_TLAST),
        .m_axis_tready(s00_regslice_to_auto_ss_slid_TREADY),
        .m_axis_tstrb(s00_regslice_to_auto_ss_slid_TSTRB),
        .m_axis_tvalid(s00_regslice_to_auto_ss_slid_TVALID),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tdest(S_AXIS_tdest),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tstrb(S_AXIS_tstrb),
        .s_axis_tvalid(S_AXIS_tvalid));
endmodule

module s01_couplers_imp_1E6CVA7
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tstrb;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [63:0]S_AXIS_tkeep;
  input [0:0]S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tstrb;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire [63:0]M_AXIS_tstrb;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire [0:0]S_AXIS_tlast;
  wire S_AXIS_tready;
  wire [63:0]S_AXIS_tstrb;
  wire S_AXIS_tvalid;
  wire [511:0]s01_regslice_to_s01_data_fifo_TDATA;
  wire [63:0]s01_regslice_to_s01_data_fifo_TKEEP;
  wire s01_regslice_to_s01_data_fifo_TLAST;
  wire s01_regslice_to_s01_data_fifo_TREADY;
  wire [63:0]s01_regslice_to_s01_data_fifo_TSTRB;
  wire s01_regslice_to_s01_data_fifo_TVALID;

  network_stack_axis_interconnect_0_imp_s01_data_fifo_0 s01_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(M_AXIS_tlast),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tstrb(M_AXIS_tstrb),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_aclk(M_AXIS_ACLK),
        .s_axis_aresetn(M_AXIS_ARESETN),
        .s_axis_tdata(s01_regslice_to_s01_data_fifo_TDATA),
        .s_axis_tkeep(s01_regslice_to_s01_data_fifo_TKEEP),
        .s_axis_tlast(s01_regslice_to_s01_data_fifo_TLAST),
        .s_axis_tready(s01_regslice_to_s01_data_fifo_TREADY),
        .s_axis_tstrb(s01_regslice_to_s01_data_fifo_TSTRB),
        .s_axis_tvalid(s01_regslice_to_s01_data_fifo_TVALID));
  network_stack_axis_interconnect_0_imp_s01_regslice_0 s01_regslice
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(s01_regslice_to_s01_data_fifo_TDATA),
        .m_axis_tkeep(s01_regslice_to_s01_data_fifo_TKEEP),
        .m_axis_tlast(s01_regslice_to_s01_data_fifo_TLAST),
        .m_axis_tready(s01_regslice_to_s01_data_fifo_TREADY),
        .m_axis_tstrb(s01_regslice_to_s01_data_fifo_TSTRB),
        .m_axis_tvalid(s01_regslice_to_s01_data_fifo_TVALID),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tstrb(S_AXIS_tstrb),
        .s_axis_tvalid(S_AXIS_tvalid));
endmodule

module s01_couplers_imp_1OL376M
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire M_AXIS_tvalid;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire S_AXIS_tvalid;
  wire [511:0]auto_ss_slid_to_s01_data_fifo_TDATA;
  wire [63:0]auto_ss_slid_to_s01_data_fifo_TKEEP;
  wire auto_ss_slid_to_s01_data_fifo_TLAST;
  wire auto_ss_slid_to_s01_data_fifo_TREADY;
  wire auto_ss_slid_to_s01_data_fifo_TVALID;
  wire [511:0]s01_regslice_to_auto_ss_slid_TDATA;
  wire [63:0]s01_regslice_to_auto_ss_slid_TKEEP;
  wire s01_regslice_to_auto_ss_slid_TLAST;
  wire s01_regslice_to_auto_ss_slid_TREADY;
  wire s01_regslice_to_auto_ss_slid_TVALID;

  network_stack_axis_interconnect_1_imp_auto_ss_slid_1 auto_ss_slid
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(auto_ss_slid_to_s01_data_fifo_TDATA),
        .m_axis_tkeep(auto_ss_slid_to_s01_data_fifo_TKEEP),
        .m_axis_tlast(auto_ss_slid_to_s01_data_fifo_TLAST),
        .m_axis_tready(auto_ss_slid_to_s01_data_fifo_TREADY),
        .m_axis_tvalid(auto_ss_slid_to_s01_data_fifo_TVALID),
        .s_axis_tdata(s01_regslice_to_auto_ss_slid_TDATA),
        .s_axis_tkeep(s01_regslice_to_auto_ss_slid_TKEEP),
        .s_axis_tlast(s01_regslice_to_auto_ss_slid_TLAST),
        .s_axis_tready(s01_regslice_to_auto_ss_slid_TREADY),
        .s_axis_tvalid(s01_regslice_to_auto_ss_slid_TVALID));
  network_stack_axis_interconnect_1_imp_s01_data_fifo_0 s01_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(M_AXIS_tdata),
        .m_axis_tkeep(M_AXIS_tkeep),
        .m_axis_tlast(M_AXIS_tlast),
        .m_axis_tready(M_AXIS_tready),
        .m_axis_tvalid(M_AXIS_tvalid),
        .s_axis_aclk(M_AXIS_ACLK),
        .s_axis_aresetn(M_AXIS_ARESETN),
        .s_axis_tdata(auto_ss_slid_to_s01_data_fifo_TDATA),
        .s_axis_tkeep(auto_ss_slid_to_s01_data_fifo_TKEEP),
        .s_axis_tlast(auto_ss_slid_to_s01_data_fifo_TLAST),
        .s_axis_tready(auto_ss_slid_to_s01_data_fifo_TREADY),
        .s_axis_tvalid(auto_ss_slid_to_s01_data_fifo_TVALID));
  network_stack_axis_interconnect_1_imp_s01_regslice_0 s01_regslice
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(s01_regslice_to_auto_ss_slid_TDATA),
        .m_axis_tkeep(s01_regslice_to_auto_ss_slid_TKEEP),
        .m_axis_tlast(s01_regslice_to_auto_ss_slid_TLAST),
        .m_axis_tready(s01_regslice_to_auto_ss_slid_TREADY),
        .m_axis_tvalid(s01_regslice_to_auto_ss_slid_TVALID),
        .s_axis_tdata(S_AXIS_tdata),
        .s_axis_tkeep(S_AXIS_tkeep),
        .s_axis_tlast(S_AXIS_tlast),
        .s_axis_tready(S_AXIS_tready),
        .s_axis_tvalid(S_AXIS_tvalid));
endmodule
