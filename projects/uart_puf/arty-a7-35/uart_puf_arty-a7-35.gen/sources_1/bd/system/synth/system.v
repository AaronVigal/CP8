//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Mon Aug  1 13:43:57 2022
//Host        : aceadmin-Latitude-5590 running 64-bit Ubuntu 22.04 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN system_clk_100mhz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_100mhz;
  output [3:0]four_leds;
  input [3:0]push_buttons;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;
  output [2:0]rgb_led0;
  output [2:0]rgb_led1;
  output [2:0]rgb_led2;
  output [2:0]rgb_led3;
  input [3:0]slide_switches;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart CTSn" *) input uart_ctsn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RTSn" *) output uart_rtsn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RxD" *) input uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart TxD" *) output uart_txd;

  wire clk_100mhz_1;
  wire resetn_1;
  wire sys_clk;
  wire [0:0]sys_reset;
  wire [0:0]sys_resetn;
  wire util_uart_puf_uart_CTSn;
  wire util_uart_puf_uart_RTSn;
  wire util_uart_puf_uart_RxD;
  wire util_uart_puf_uart_TxD;

  assign clk_100mhz_1 = clk_100mhz;
  assign resetn_1 = resetn;
  assign uart_rtsn = util_uart_puf_uart_RTSn;
  assign uart_txd = util_uart_puf_uart_TxD;
  assign util_uart_puf_uart_CTSn = uart_ctsn;
  assign util_uart_puf_uart_RxD = uart_rxd;
  system_clk_wiz_48mhz_0 clk_wiz_48mhz
       (.clk_in1(clk_100mhz_1),
        .clk_out1(sys_clk),
        .resetn(resetn_1));
  system_sys_rstgen_0 sys_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(resetn_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(sys_resetn),
        .peripheral_reset(sys_reset),
        .slowest_sync_clk(sys_clk));
  system_util_uart_puf_0 util_uart_puf
       (.aclk(sys_clk),
        .arstn(sys_resetn),
        .cts_UART(util_uart_puf_uart_CTSn),
        .rts_UART(util_uart_puf_uart_RTSn),
        .rx_UART(util_uart_puf_uart_RxD),
        .tx_UART(util_uart_puf_uart_TxD),
        .uart_clk(sys_clk),
        .uart_rstn(sys_resetn));
endmodule
