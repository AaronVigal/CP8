// ***************************************************************************
// ***************************************************************************
// @FILE    util_uart_puf_core.v
// @AUTHOR  JAY CONVERTINO
// @DATE    2022.04.25
// @BRIEF   UART PUF CORE
// @DETAILS Core that ties together all ips into a single uart to puf core.
//
// @LICENSE MIT
//  Copyright 2022 Jay Convertino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to 
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
//  sell copies of the Software, and to permit persons to whom the Software is 
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

//uart puf core
module util_uart_puf_core #(
    parameter clock_speed = 2000000,
    parameter uart_baud_clock_speed  = 2000000,
    parameter uart_baud_rate   = 9600,
    parameter uart_parity_ena  = 0,
    parameter uart_parity_type = 0,
    parameter uart_stop_bits   = 1,
    parameter uart_data_bits   = 8,
    parameter uart_rx_delay    = 0,
    parameter uart_tx_delay    = 0
  )
  (
    //master clock and reset.
    input aclk,
    input arstn,
    //uart clocks
    input uart_clk,
    input uart_rstn,
    //uart i/o
    input   rx_UART,
    output  tx_UART,
    output  rts_UART,
    input   cts_UART
  );
  
  //puf ctrl to puf
  wire [ 7:0]   w_puf_data;
  wire          w_puf_valid;
  wire [ 7:0]   w_puf_sela;
  wire [ 7:0]   w_puf_selb;
  wire          w_puf_w;
  
  //output path
  //puf ctrl m_axis (data output)
  wire [ 7:0]   pufctrl_output_data;
  wire          pufctrl_output_valid;
  wire          pufctrl_output_ready;
  //decoder fifo m_axis (data output)
  wire [ 7:0]   mfifo_output_data;
  wire          mfifo_output_valid;
  wire [ 3:0]   mfifo_output_user;
  wire          mfifo_output_ready;
  //string encoder m_axis (data output)
  wire [ 87:0]  mstring_encoder_data;
  wire          mstring_encoder_valid;
  wire          mstring_encoder_ready;
  //data width converter (string to char) m_axis (data output)
  wire [ 7:0]   mstring_to_char_data;
  wire          mstring_to_char_valid;
  wire          mstring_to_char_ready;
  //fifo char data for string to char m_axis (data output)
  wire [ 7:0]   mout_char_fifo_data;
  wire          mout_char_fifo_valid;
  wire          mout_char_fifo_ready;
  
  //encoder path
  //uart m_axis (data output)
  wire [ 7:0]   muart_char_data;
  wire          muart_char_valid;
  wire          muart_char_ready;
  //fifo char data for tx uart m_axis (data output)
  wire [ 7:0]   min_char_fifo_data;
  wire          min_char_fifo_valid;
  wire          min_char_fifo_ready;
  //string builder m_axis (data output)
  wire [ 87:0]  mchar_to_string_data;
  wire          mchar_to_string_valid;
  wire          mchar_to_string_ready;
  //string decoder m_axis (data output)
  wire [ 7:0]   mstring_output_data;
  wire          mstring_output_valid;
  wire [ 3:0]   mstring_output_user;
  wire          mstring_output_ready;
  //fifo encoder
  wire [ 7:0]   mfifo_encoder_data;
  wire          mfifo_encoder_valid;
  wire [ 3:0]   mfifo_encoder_user;
  wire          mfifo_encoder_ready;
  
  //puf output path
  //fifo for output data
  util_axis_xfifo #(
    .FIFO_DEPTH  (32),
    .COUNT_WIDTH (0),
    .BUS_WIDTH   (1),
    .USER_WIDTH  (1),
    .DEST_WIDTH  (1),
    .RAM_TYPE    ("block"),
    .PACKET_MODE (0),
    .COUNT_DELAY (0),
    .COUNT_ENA   (0)
  ) output_fifo (
    // write
    .s_axis_aclk(aclk),
    .s_axis_arstn(arstn),
    .s_axis_tvalid(pufctrl_output_valid),
    .s_axis_tready(pufctrl_output_ready),
    .s_axis_tdata(pufctrl_output_data),
    .s_axis_tkeep(~0),
    .s_axis_tlast(0),
    .s_axis_tuser(0),
    .s_axis_tdest(0),
    // read
    .m_axis_aclk(aclk),
    .m_axis_arstn(arstn),
    .m_axis_tvalid(mfifo_output_valid),
    .m_axis_tready(mfifo_output_ready),
    .m_axis_tdata(mfifo_output_data),
    .m_axis_tkeep(),
    .m_axis_tlast(),
    .m_axis_tuser(),
    .m_axis_tdest(),
    // data count
    .data_count_aclk(0),
    .data_count_arstn(0),
    .data_count()
  );
  
  //1553 to string core
  util_axis_puf_string_encoder string_encoder
  (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //axis slave interface (input)
    .s_axis_tdata(mfifo_output_data),
    .s_axis_tvalid(mfifo_output_valid),
    .s_axis_tready(mfifo_output_ready),
    //axis master interface (out)
    .m_axis_tdata(mstring_encoder_data),
    .m_axis_tvalid(mstring_encoder_valid),
    .m_axis_tready(mstring_encoder_ready)
  );
  

  //data width converter
  util_axis_data_width_converter #(
    .slave_width(11),
    .master_width(1)
  ) string_to_char (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //slave input axis
    .s_axis_tdata(mstring_encoder_data),
    .s_axis_tvalid(mstring_encoder_valid),
    .s_axis_tready(mstring_encoder_ready),
    //master output axis
    .m_axis_tdata(mstring_to_char_data),
    .m_axis_tvalid(mstring_to_char_valid),
    .m_axis_tready(mstring_to_char_ready)
  );
  
  //fifo for 1553 encoded into character string.
  util_axis_tiny_fifo #(
    .depth(4),
    .width(8)
  ) outgoing_char_fifo (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //slave input axis
    .s_axis_tdata(mstring_to_char_data),
    .s_axis_tvalid(mstring_to_char_valid),
    .s_axis_tready(mstring_to_char_ready),
    //master output axis
    .m_axis_tdata(mout_char_fifo_data),
    .m_axis_tvalid(mout_char_fifo_valid),
    .m_axis_tready(mout_char_fifo_ready)
  );
  
  //common between input/output
  //UART
  util_axis_uart #(
    .baud_clock_speed(uart_baud_clock_speed),
    .baud_rate(uart_baud_rate),
    .parity_ena(uart_parity_ena),
    .parity_type(uart_parity_type),
    .stop_bits(uart_stop_bits),
    .data_bits(uart_data_bits),
    .rx_delay(uart_rx_delay),
    .tx_delay(uart_tx_delay)
  ) axis_uart (
    //clock and reset
    .aclk(aclk),
    .arstn(arstn),
    //slave input
    .s_axis_tdata(mout_char_fifo_data),
    .s_axis_tvalid(mout_char_fifo_valid),
    .s_axis_tready(mout_char_fifo_ready),
    //master output
    .m_axis_tdata(muart_char_data),
    .m_axis_tvalid(muart_char_valid),
    .m_axis_tready(muart_char_ready),
    //UART
    .uart_clk(uart_clk),
    .uart_rstn(uart_rstn),
    .tx(tx_UART),
    .rx(rx_UART),
    .rts(rts_UART),
    .cts(cts_UART)
  );
  
  //string to puf
  util_axis_puf_controller puf_ctrl
  (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //axis slave interface (input)
    .s_axis_tdata(mfifo_encoder_data),
    .s_axis_tvalid(mfifo_encoder_valid),
    .s_axis_tuser(mfifo_encoder_user),
    .s_axis_tready(mfifo_encoder_ready),
    //axis master interface (out)
    .m_axis_tdata(pufctrl_output_data),
    .m_axis_tvalid(pufctrl_output_valid),
    .m_axis_tready(pufctrl_output_ready),
    //puf interface (in/out)
    .puf_data(w_puf_data),
    .puf_valid(w_puf_valid),
    .puf_sela(w_puf_sela),
    .puf_selb(w_puf_selb),
    .puf_w(w_puf_w)
  );
  
  //puf
  util_puf_core #(
    .delay_clk(125000),
    .ro_PUF_width(8),
    .RO_sel(8)
  ) puf ( 
    .clock(aclk),
    .w(w_puf_w),
    .reset(~arstn),
    .selA(w_puf_sela),
    .selB(w_puf_selb),
    .res_ar(w_puf_data),
    .valid(w_puf_valid)
  );
  
  //encoder path
  //fifo for chars to be decoded into 1553 data.
  util_axis_tiny_fifo #(
    .depth(4),
    .width(8)
  ) incomming_char_fifo (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //slave input axis
    .s_axis_tdata(muart_char_data),
    .s_axis_tvalid(muart_char_valid),
    .s_axis_tready(muart_char_ready),
    //master output axis
    .m_axis_tdata(min_char_fifo_data),
    .m_axis_tvalid(min_char_fifo_valid),
    .m_axis_tready(min_char_fifo_ready)
  );
  
  //data width converter
  util_axis_char_to_string_converter #(
    .master_width(11)
  ) char_to_string (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //slave input axis
    .s_axis_tdata(min_char_fifo_data),
    .s_axis_tvalid(min_char_fifo_valid),
    .s_axis_tready(min_char_fifo_ready),
    //master output axis
    .m_axis_tdata(mchar_to_string_data),
    .m_axis_tvalid(mchar_to_string_valid),
    .m_axis_tready(mchar_to_string_ready)
  );
  
  //string to puf
  util_axis_puf_string_decoder string_decoder
  (
    //axi streaming clock and reset.
    .aclk(aclk),
    .arstn(arstn),
    //axis slave interface (input)
    .s_axis_tdata(mchar_to_string_data),
    .s_axis_tvalid(mchar_to_string_valid),
    .s_axis_tready(mchar_to_string_ready),
    //axis master interface (out)
    .m_axis_tdata(mstring_output_data),
    .m_axis_tvalid(mstring_output_valid),
    .m_axis_tuser(mstring_output_user),
    .m_axis_tready(mstring_output_ready)
  );
  
  //fifo for decoder data
  util_axis_xfifo #(
    .FIFO_DEPTH  (32),
    .COUNT_WIDTH (0),
    .BUS_WIDTH   (1),
    .USER_WIDTH  (4),
    .DEST_WIDTH  (1),
    .RAM_TYPE    ("block"),
    .PACKET_MODE (0),
    .COUNT_DELAY (0),
    .COUNT_ENA   (0)
  ) encoder_fifo (
    // write
    .s_axis_aclk(aclk),
    .s_axis_arstn(arstn),
    .s_axis_tvalid(mstring_output_valid),
    .s_axis_tready(mstring_output_ready),
    .s_axis_tdata(mstring_output_data),
    .s_axis_tkeep(~0),
    .s_axis_tlast(0),
    .s_axis_tuser(mstring_output_user),
    .s_axis_tdest(0),
    // read
    .m_axis_aclk(aclk),
    .m_axis_arstn(arstn),
    .m_axis_tvalid(mfifo_encoder_valid),
    .m_axis_tready(mfifo_encoder_ready),
    .m_axis_tdata(mfifo_encoder_data),
    .m_axis_tkeep(),
    .m_axis_tlast(),
    .m_axis_tuser(mfifo_encoder_user),
    .m_axis_tdest(),
    // data count
    .data_count_aclk(0),
    .data_count_arstn(0),
    .data_count()
  );
  
endmodule
