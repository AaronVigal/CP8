# get clock frequency from pll/mcmm
set CLK_FREQ_HZ [get_property CONFIG.FREQ_HZ [get_bd_pins -of_objects $sys_clk -filter {DIR == "O"}]]

# util_uart_puf_core

ad_ip_instance util_uart_puf_core util_uart_puf

ad_ip_parameter util_uart_puf CONFIG.clock_speed $CLK_FREQ_HZ
ad_ip_parameter util_uart_puf CONFIG.uart_baud_clock_speed $CLK_FREQ_HZ
ad_ip_parameter util_uart_puf CONFIG.uart_baud_rate {115200}
ad_ip_parameter util_uart_puf CONFIG.uart_rx_delay {4}
ad_ip_parameter util_uart_puf CONFIG.uart_tx_delay {4}
ad_ip_parameter util_uart_puf CONFIG.uart_parity_ena {0}

# connections

ad_connect $sys_clk     util_uart_puf/aclk
ad_connect $sys_clk     util_uart_puf/uart_clk
ad_connect uart         util_uart_puf/uart
ad_connect $sys_resetn  util_uart_puf/arstn
ad_connect $sys_resetn  util_uart_puf/uart_rstn
