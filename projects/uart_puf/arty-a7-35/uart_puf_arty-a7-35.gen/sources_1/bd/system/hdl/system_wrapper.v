//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Mon Aug  1 13:43:57 2022
//Host        : aceadmin-Latitude-5590 running 64-bit Ubuntu 22.04 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (clk_100mhz,
    four_leds,
    push_buttons,
    resetn,
    rgb_led0,
    rgb_led1,
    rgb_led2,
    rgb_led3,
    slide_switches,
    uart_ctsn,
    uart_rtsn,
    uart_rxd,
    uart_txd);
  input clk_100mhz;
  output [3:0]four_leds;
  input [3:0]push_buttons;
  input resetn;
  output [2:0]rgb_led0;
  output [2:0]rgb_led1;
  output [2:0]rgb_led2;
  output [2:0]rgb_led3;
  input [3:0]slide_switches;
  input uart_ctsn;
  output uart_rtsn;
  input uart_rxd;
  output uart_txd;

  wire clk_100mhz;
  wire [3:0]four_leds;
  wire [3:0]push_buttons;
  wire resetn;
  wire [2:0]rgb_led0;
  wire [2:0]rgb_led1;
  wire [2:0]rgb_led2;
  wire [2:0]rgb_led3;
  wire [3:0]slide_switches;
  wire uart_ctsn;
  wire uart_rtsn;
  wire uart_rxd;
  wire uart_txd;

  system system_i
       (.clk_100mhz(clk_100mhz),
        .four_leds(four_leds),
        .push_buttons(push_buttons),
        .resetn(resetn),
        .rgb_led0(rgb_led0),
        .rgb_led1(rgb_led1),
        .rgb_led2(rgb_led2),
        .rgb_led3(rgb_led3),
        .slide_switches(slide_switches),
        .uart_ctsn(uart_ctsn),
        .uart_rtsn(uart_rtsn),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
