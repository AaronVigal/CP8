////////////////////////////////////////////////////////////////////////////////
// @file    tb_core.v
// @author  JAY CONVERTINO
// @date    2022.04.25
// @brief   SIMPLE TEST BENCH FOR UART TO PUF in a loop.
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/10 ps

//testing with 100 Mhz clock, and a 250 Khz baud rate (FT2232HQ)

module tb_core;
  
  reg         tb_data_clk = 0;
  reg         tb_baud_clk = 0;
  reg         tb_rst = 0;
  reg         tb_uart_rx = 1;
  wire        tb_uart_tx;
  reg  [ 2:0] tb_string_sel = 0;
  reg  [ 9:0] tb_send_string = 0;
  
  integer string_counter = 0;
  
  integer rx_counter = 0;
  
  localparam string_len = 109;
  
  reg [87:0] TB_SELA_SET = {"SELA;Hx55;", 8'h0D};
  reg [87:0] TB_SELB_SET = {"SELB;Hx88;", 8'h0D};
  reg [87:0] TB_STAR_SET = {"START;NOW;", 8'h0D};
  reg [87:0] TB_ANSW_REC = 0;

  //1ns
  localparam BAUD_CLK_PERIOD  = 4000;
  localparam CLK_PERIOD       = 10;
  localparam RST_PERIOD       = 1000;
  localparam CLK_SPEED_HZ     = 1000000000/CLK_PERIOD;
  
  //device under test
  //uart 1553 core
  util_uart_puf_core #(
    .clock_speed(CLK_SPEED_HZ),
    .uart_baud_clock_speed(CLK_SPEED_HZ),
    .uart_baud_rate(250000),
    .uart_parity_ena(0),
    .uart_parity_type(1),
    .uart_stop_bits(1),
    .uart_data_bits(8),
    .uart_rx_delay(0)
  ) dut (
    //master clock and reset.
    .aclk(tb_data_clk),
    .arstn(~tb_rst),
    //uart clocks
    .uart_clk(tb_data_clk),
    .uart_rstn(~tb_rst),
    //uart i/o
    .rx_UART(tb_uart_rx),
    .tx_UART(tb_uart_tx),
    .rts_UART(),
    .cts_UART(1'b1)
  );
    
  //reset
  initial
  begin
    tb_rst <= 1'b1;
    
    #RST_PERIOD;
    
    tb_rst <= 1'b0;
  end
  
  //copy pasta, vcd generation
  initial
  begin
    $dumpfile("sim/icarus/tb_core.vcd");
    $dumpvars(0, tb_core);
  end
  
  //clock
  always
  begin
    tb_data_clk <= ~tb_data_clk;
    
    #(CLK_PERIOD/2);
  end
  
  //clock
  always
  begin
    tb_baud_clk <= ~tb_baud_clk;
    
    #(BAUD_CLK_PERIOD/2);
  end
  
  
  //produce data
  always @(posedge tb_baud_clk)
  begin
    if (tb_rst == 1'b1) begin
      tb_uart_rx      <= 1'b1;
      tb_string_sel   <= 3'b001;
      string_counter  <= 9;
      rx_counter      <= 0;
      tb_send_string  <= 10'b1000000000;
      TB_SELA_SET <= {TB_SELA_SET[79:0], TB_SELA_SET[87:80]};
      tb_send_string[8:1] <= TB_SELA_SET[87:80];
    end else begin
      string_counter <= string_counter + 1;
      rx_counter     <= rx_counter + 1;
      
      tb_uart_rx <= tb_send_string[rx_counter];
      
      TB_ANSW_REC <= {tb_uart_tx, TB_ANSW_REC[87:1]};
      
      if(rx_counter >= 9) begin
        case(tb_string_sel)
          3'b001: begin
            TB_SELA_SET <= {TB_SELA_SET[79:0], TB_SELA_SET[87:80]};
            tb_send_string[8:1] <= TB_SELA_SET[87:80];
          end
          3'b010: begin
            TB_SELB_SET <= {TB_SELB_SET[79:0], TB_SELB_SET[87:80]};
            tb_send_string[8:1] <= TB_SELB_SET[87:80];
          end
          3'b100: begin
            TB_STAR_SET <= {TB_STAR_SET[79:0], TB_STAR_SET[87:80]};
            tb_send_string[8:1] <= TB_STAR_SET[87:80];
          end
        endcase
        
        rx_counter <= 0;
      end
      
      if(string_counter >= string_len) begin
        string_counter  <= 0;
        tb_string_sel   <= {tb_string_sel[1:0], tb_string_sel[2]};
      end
    end
  end
  
  //copy pasta, no way to set runtime... this works in vivado as well.
//   initial begin
//     #2_000_000; // Wait a long time in simulation units (adjust as needed).
//     $display("END SIMULATION");
//     $finish;
//   end
endmodule

