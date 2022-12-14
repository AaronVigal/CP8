// ***************************************************************************
// ***************************************************************************
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (
  // clock and reset
  input           clk_100mhz,
  input           resetn,
  
  // general io
  output  [3:0]   four_leds,
  
  output  [2:0]   rgb_led0,
  output  [2:0]   rgb_led1,
  output  [2:0]   rgb_led2,
  output  [2:0]   rgb_led3,
  
  input   [3:0]   push_buttons,
  
  input   [3:0]   slide_switches,
  
  // pmod
  inout   [7:0]   pmod_ja,
  inout   [7:0]   pmod_jb,
  inout   [7:0]   pmod_jc,
  inout   [7:0]   pmod_jd,
  
  // uart
  output           ftdi_rx,
  input            ftdi_tx
  );
  
  system_wrapper i_system_wrapper (
    .clk_100mhz(clk_100mhz),
    .four_leds(four_leds),
    .rgb_led0(rgb_led0),
    .rgb_led1(rgb_led1),
    .rgb_led2(rgb_led2),
    .rgb_led3(rgb_led3),
    .push_buttons(push_buttons),
    .slide_switches(slide_switches),
    .resetn(resetn),
    .uart_rxd(ftdi_tx),
    .uart_txd(ftdi_rx),
    .uart_rtsn(),
    .uart_ctsn(1'b1)
  );

endmodule
