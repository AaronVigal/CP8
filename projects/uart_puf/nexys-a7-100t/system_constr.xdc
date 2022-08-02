set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

## I/O delay constraints
create_clock -period 20.833 -name VIRTUAL_clk_out1_system_clk_wiz_48mhz_0 -waveform {0.000 10.417}
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -min -add_delay 0.500 [get_ports {push_buttons[*]}]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -max -add_delay 2.000 [get_ports {push_buttons[*]}]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -min -add_delay 0.020 [get_ports ftdi_tx]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -max -add_delay 0.300 [get_ports ftdi_tx]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -min -add_delay 0.050 [get_ports ftdi_rx]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_system_clk_wiz_48mhz_0] -max -add_delay 0.500 [get_ports ftdi_rx]


set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]







