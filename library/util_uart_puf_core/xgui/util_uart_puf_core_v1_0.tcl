# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "clock_speed" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_baud_clock_speed" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_baud_rate" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_data_bits" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_parity_ena" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_parity_type" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_rx_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_stop_bits" -parent ${Page_0}
  ipgui::add_param $IPINST -name "uart_tx_delay" -parent ${Page_0}


}

proc update_PARAM_VALUE.clock_speed { PARAM_VALUE.clock_speed } {
	# Procedure called to update clock_speed when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clock_speed { PARAM_VALUE.clock_speed } {
	# Procedure called to validate clock_speed
	return true
}

proc update_PARAM_VALUE.uart_baud_clock_speed { PARAM_VALUE.uart_baud_clock_speed } {
	# Procedure called to update uart_baud_clock_speed when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_baud_clock_speed { PARAM_VALUE.uart_baud_clock_speed } {
	# Procedure called to validate uart_baud_clock_speed
	return true
}

proc update_PARAM_VALUE.uart_baud_rate { PARAM_VALUE.uart_baud_rate } {
	# Procedure called to update uart_baud_rate when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_baud_rate { PARAM_VALUE.uart_baud_rate } {
	# Procedure called to validate uart_baud_rate
	return true
}

proc update_PARAM_VALUE.uart_data_bits { PARAM_VALUE.uart_data_bits } {
	# Procedure called to update uart_data_bits when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_data_bits { PARAM_VALUE.uart_data_bits } {
	# Procedure called to validate uart_data_bits
	return true
}

proc update_PARAM_VALUE.uart_parity_ena { PARAM_VALUE.uart_parity_ena } {
	# Procedure called to update uart_parity_ena when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_parity_ena { PARAM_VALUE.uart_parity_ena } {
	# Procedure called to validate uart_parity_ena
	return true
}

proc update_PARAM_VALUE.uart_parity_type { PARAM_VALUE.uart_parity_type } {
	# Procedure called to update uart_parity_type when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_parity_type { PARAM_VALUE.uart_parity_type } {
	# Procedure called to validate uart_parity_type
	return true
}

proc update_PARAM_VALUE.uart_rx_delay { PARAM_VALUE.uart_rx_delay } {
	# Procedure called to update uart_rx_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_rx_delay { PARAM_VALUE.uart_rx_delay } {
	# Procedure called to validate uart_rx_delay
	return true
}

proc update_PARAM_VALUE.uart_stop_bits { PARAM_VALUE.uart_stop_bits } {
	# Procedure called to update uart_stop_bits when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_stop_bits { PARAM_VALUE.uart_stop_bits } {
	# Procedure called to validate uart_stop_bits
	return true
}

proc update_PARAM_VALUE.uart_tx_delay { PARAM_VALUE.uart_tx_delay } {
	# Procedure called to update uart_tx_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.uart_tx_delay { PARAM_VALUE.uart_tx_delay } {
	# Procedure called to validate uart_tx_delay
	return true
}


proc update_MODELPARAM_VALUE.clock_speed { MODELPARAM_VALUE.clock_speed PARAM_VALUE.clock_speed } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clock_speed}] ${MODELPARAM_VALUE.clock_speed}
}

proc update_MODELPARAM_VALUE.uart_baud_clock_speed { MODELPARAM_VALUE.uart_baud_clock_speed PARAM_VALUE.uart_baud_clock_speed } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_baud_clock_speed}] ${MODELPARAM_VALUE.uart_baud_clock_speed}
}

proc update_MODELPARAM_VALUE.uart_baud_rate { MODELPARAM_VALUE.uart_baud_rate PARAM_VALUE.uart_baud_rate } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_baud_rate}] ${MODELPARAM_VALUE.uart_baud_rate}
}

proc update_MODELPARAM_VALUE.uart_parity_ena { MODELPARAM_VALUE.uart_parity_ena PARAM_VALUE.uart_parity_ena } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_parity_ena}] ${MODELPARAM_VALUE.uart_parity_ena}
}

proc update_MODELPARAM_VALUE.uart_parity_type { MODELPARAM_VALUE.uart_parity_type PARAM_VALUE.uart_parity_type } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_parity_type}] ${MODELPARAM_VALUE.uart_parity_type}
}

proc update_MODELPARAM_VALUE.uart_stop_bits { MODELPARAM_VALUE.uart_stop_bits PARAM_VALUE.uart_stop_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_stop_bits}] ${MODELPARAM_VALUE.uart_stop_bits}
}

proc update_MODELPARAM_VALUE.uart_data_bits { MODELPARAM_VALUE.uart_data_bits PARAM_VALUE.uart_data_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_data_bits}] ${MODELPARAM_VALUE.uart_data_bits}
}

proc update_MODELPARAM_VALUE.uart_rx_delay { MODELPARAM_VALUE.uart_rx_delay PARAM_VALUE.uart_rx_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_rx_delay}] ${MODELPARAM_VALUE.uart_rx_delay}
}

proc update_MODELPARAM_VALUE.uart_tx_delay { MODELPARAM_VALUE.uart_tx_delay PARAM_VALUE.uart_tx_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.uart_tx_delay}] ${MODELPARAM_VALUE.uart_tx_delay}
}

