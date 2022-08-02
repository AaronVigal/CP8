//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
//Date        : Wed Apr 27 12:44:09 2022
//Host        : Armistead running 64-bit Ubuntu 20.04.4 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (clk_12mhz,
    four_leds,
    push_buttons,
    reset,
    rgb_led,
    uart_ctsn,
    uart_rtsn,
    uart_rxd,
    uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_12MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_12MHZ, CLK_DOMAIN system_clk_12mhz, FREQ_HZ 12000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_12mhz;
  output [3:0]four_leds;
  input [1:0]push_buttons;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  output [2:0]rgb_led;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart CTSn" *) input uart_ctsn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RTSn" *) output uart_rtsn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RxD" *) input uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart TxD" *) output uart_txd;

  wire clk_12mhz_1;
  wire reset_1;
  wire sys_clk;
  wire [0:0]sys_reset;
  wire [0:0]sys_resetn;
  wire util_uart_puf_uart_CTSn;
  wire util_uart_puf_uart_RTSn;
  wire util_uart_puf_uart_RxD;
  wire util_uart_puf_uart_TxD;

  assign clk_12mhz_1 = clk_12mhz;
  assign reset_1 = reset;
  assign uart_rtsn = util_uart_puf_uart_RTSn;
  assign uart_txd = util_uart_puf_uart_TxD;
  assign util_uart_puf_uart_CTSn = uart_ctsn;
  assign util_uart_puf_uart_RxD = uart_rxd;
  system_clk_wiz_48mhz_0 clk_wiz_48mhz
       (.clk_in1(clk_12mhz_1),
        .clk_out1(sys_clk),
        .reset(reset_1));
  system_sys_rstgen_0 sys_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(reset_1),
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
