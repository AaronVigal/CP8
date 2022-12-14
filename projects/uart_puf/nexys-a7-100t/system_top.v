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
  output  [15:0]   leds,
  
  output  [2:0]   rgb_led0,
  output  [2:0]   rgb_led1,
  
  input   [4:0]   push_buttons,
  
  input   [15:0]  slide_switches,
  
  // pmod
  inout   [7:0]   pmod_ja,
  inout   [7:0]   pmod_jb,
  inout   [7:0]   pmod_jc,
  inout   [7:0]   pmod_jd,
  
  // uart
  input           ftdi_tx,
  output          ftdi_rx,
  input           ftdi_rts,
  output          ftdi_cts
  );
  
  system_wrapper i_system_wrapper (
    .clk_100mhz(clk_100mhz),
    .leds(leds),
    .rgb_led0(rgb_led0),
    .rgb_led1(rgb_led1),
    .push_buttons(push_buttons),
    .slide_switches(slide_switches),
    .resetn(resetn),
    .uart_rxd(ftdi_tx),
    .uart_txd(ftdi_rx),
    .uart_rtsn(ftdi_cts),
    .uart_ctsn(ftdi_rts)
  );

endmodule
