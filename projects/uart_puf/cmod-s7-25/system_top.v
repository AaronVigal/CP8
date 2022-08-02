// ***************************************************************************
// ***************************************************************************
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (
  // clock and reset
  input           clk_12mhz,
  // general io
  output  [3:0]   four_leds,
  output  [2:0]   rgb_led,
  input   [1:0]   push_buttons,
  // pmod
  inout   [7:0]   pmod_ja,
  // uart
  input           ftdi_tx,
  output          ftdi_rx
  );
  
  system_wrapper i_system_wrapper (
    .clk_12mhz(clk_12mhz),
    .four_leds(four_leds),
    .rgb_led(rgb_led),
    .push_buttons(push_buttons),
    .reset(push_buttons[0]),
    .uart_rxd(ftdi_tx),
    .uart_txd(ftdi_rx),
    .uart_rtsn(),
    .uart_ctsn(1'b1)
  );

endmodule
