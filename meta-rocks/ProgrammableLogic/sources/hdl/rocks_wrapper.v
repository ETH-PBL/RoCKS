//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Wed Mar  4 10:01:49 2026
//Host        : michael-System-Product-Name running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target rocks_wrapper.bd
//Design      : rocks_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rocks_wrapper
   (clk_25mhz_ref,
    fan_en_b,
    led,
    sfp0_rx_n,
    sfp0_rx_p,
    sfp0_tx_disable_b,
    sfp0_tx_n,
    sfp0_tx_p,
    sfp_mgt_refclk_0_n,
    sfp_mgt_refclk_0_p);
  input clk_25mhz_ref;
  output [0:0]fan_en_b;
  output [1:0]led;
  input sfp0_rx_n;
  input sfp0_rx_p;
  output sfp0_tx_disable_b;
  output sfp0_tx_n;
  output sfp0_tx_p;
  input sfp_mgt_refclk_0_n;
  input sfp_mgt_refclk_0_p;

  wire clk_25mhz_ref;
  wire [0:0]fan_en_b;
  wire [1:0]led;
  wire sfp0_rx_n;
  wire sfp0_rx_p;
  wire sfp0_tx_disable_b;
  wire sfp0_tx_n;
  wire sfp0_tx_p;
  wire sfp_mgt_refclk_0_n;
  wire sfp_mgt_refclk_0_p;

  rocks rocks_i
       (.clk_25mhz_ref(clk_25mhz_ref),
        .fan_en_b(fan_en_b),
        .led(led),
        .sfp0_rx_n(sfp0_rx_n),
        .sfp0_rx_p(sfp0_rx_p),
        .sfp0_tx_disable_b(sfp0_tx_disable_b),
        .sfp0_tx_n(sfp0_tx_n),
        .sfp0_tx_p(sfp0_tx_p),
        .sfp_mgt_refclk_0_n(sfp_mgt_refclk_0_n),
        .sfp_mgt_refclk_0_p(sfp_mgt_refclk_0_p));
endmodule
