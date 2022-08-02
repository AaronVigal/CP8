//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
//Date        : Wed Apr 27 12:44:09 2022
//Host        : Armistead running 64-bit Ubuntu 20.04.4 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (clk_12mhz,
    four_leds,
    push_buttons,
    reset,
    rgb_led,
    uart_ctsn,
    uart_rtsn,
    uart_rxd,
    uart_txd);
  input clk_12mhz;
  output [3:0]four_leds;
  input [1:0]push_buttons;
  input reset;
  output [2:0]rgb_led;
  input uart_ctsn;
  output uart_rtsn;
  input uart_rxd;
  output uart_txd;

  wire clk_12mhz;
  wire [3:0]four_leds;
  wire [1:0]push_buttons;
  wire reset;
  wire [2:0]rgb_led;
  wire uart_ctsn;
  wire uart_rtsn;
  wire uart_rxd;
  wire uart_txd;

  system system_i
       (.clk_12mhz(clk_12mhz),
        .four_leds(four_leds),
        .push_buttons(push_buttons),
        .reset(reset),
        .rgb_led(rgb_led),
        .uart_ctsn(uart_ctsn),
        .uart_rtsn(uart_rtsn),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
