// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: afrl.mil:user:util_uart_puf_core:1.0
// IP Revision: 1

(* X_CORE_INFO = "util_uart_puf_core,Vivado 2020.2" *)
(* CHECK_LICENSE_TYPE = "system_util_uart_puf_0,util_uart_puf_core,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_util_uart_puf_0 (
  aclk,
  arstn,
  uart_clk,
  uart_rstn,
  rx_UART,
  tx_UART,
  rts_UART,
  cts_UART
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_RESET arstn, FREQ_HZ 48000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_48mhz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME arstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 arstn RST" *)
input wire arstn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME uart_clk, ASSOCIATED_RESET uart_rstn, ASSOCIATED_BUSIF uart, FREQ_HZ 48000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_48mhz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 uart_clk CLK" *)
input wire uart_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME uart_rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 uart_rstn RST" *)
input wire uart_rstn;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RxD" *)
input wire rx_UART;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart TxD" *)
output wire tx_UART;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart RTSn" *)
output wire rts_UART;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart CTSn" *)
input wire cts_UART;

  util_uart_puf_core #(
    .clock_speed(48000000),
    .uart_baud_clock_speed(48000000),
    .uart_baud_rate(115200),
    .uart_parity_ena(0),
    .uart_parity_type(0),
    .uart_stop_bits(1),
    .uart_data_bits(8),
    .uart_rx_delay(4),
    .uart_tx_delay(4)
  ) inst (
    .aclk(aclk),
    .arstn(arstn),
    .uart_clk(uart_clk),
    .uart_rstn(uart_rstn),
    .rx_UART(rx_UART),
    .tx_UART(tx_UART),
    .rts_UART(rts_UART),
    .cts_UART(cts_UART)
  );
endmodule
