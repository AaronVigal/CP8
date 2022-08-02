# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "baud_clock_speed" -parent ${Page_0}
  ipgui::add_param $IPINST -name "baud_rate" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_bits" -parent ${Page_0}
  ipgui::add_param $IPINST -name "parity_ena" -parent ${Page_0}
  ipgui::add_param $IPINST -name "parity_type" -parent ${Page_0}
  ipgui::add_param $IPINST -name "rx_baud_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "rx_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "stop_bits" -parent ${Page_0}
  ipgui::add_param $IPINST -name "tx_baud_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "tx_delay" -parent ${Page_0}


}

proc update_PARAM_VALUE.baud_clock_speed { PARAM_VALUE.baud_clock_speed } {
	# Procedure called to update baud_clock_speed when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.baud_clock_speed { PARAM_VALUE.baud_clock_speed } {
	# Procedure called to validate baud_clock_speed
	return true
}

proc update_PARAM_VALUE.baud_rate { PARAM_VALUE.baud_rate } {
	# Procedure called to update baud_rate when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.baud_rate { PARAM_VALUE.baud_rate } {
	# Procedure called to validate baud_rate
	return true
}

proc update_PARAM_VALUE.data_bits { PARAM_VALUE.data_bits } {
	# Procedure called to update data_bits when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_bits { PARAM_VALUE.data_bits } {
	# Procedure called to validate data_bits
	return true
}

proc update_PARAM_VALUE.parity_ena { PARAM_VALUE.parity_ena } {
	# Procedure called to update parity_ena when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.parity_ena { PARAM_VALUE.parity_ena } {
	# Procedure called to validate parity_ena
	return true
}

proc update_PARAM_VALUE.parity_type { PARAM_VALUE.parity_type } {
	# Procedure called to update parity_type when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.parity_type { PARAM_VALUE.parity_type } {
	# Procedure called to validate parity_type
	return true
}

proc update_PARAM_VALUE.rx_baud_delay { PARAM_VALUE.rx_baud_delay } {
	# Procedure called to update rx_baud_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.rx_baud_delay { PARAM_VALUE.rx_baud_delay } {
	# Procedure called to validate rx_baud_delay
	return true
}

proc update_PARAM_VALUE.rx_delay { PARAM_VALUE.rx_delay } {
	# Procedure called to update rx_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.rx_delay { PARAM_VALUE.rx_delay } {
	# Procedure called to validate rx_delay
	return true
}

proc update_PARAM_VALUE.stop_bits { PARAM_VALUE.stop_bits } {
	# Procedure called to update stop_bits when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.stop_bits { PARAM_VALUE.stop_bits } {
	# Procedure called to validate stop_bits
	return true
}

proc update_PARAM_VALUE.tx_baud_delay { PARAM_VALUE.tx_baud_delay } {
	# Procedure called to update tx_baud_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.tx_baud_delay { PARAM_VALUE.tx_baud_delay } {
	# Procedure called to validate tx_baud_delay
	return true
}

proc update_PARAM_VALUE.tx_delay { PARAM_VALUE.tx_delay } {
	# Procedure called to update tx_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.tx_delay { PARAM_VALUE.tx_delay } {
	# Procedure called to validate tx_delay
	return true
}


proc update_MODELPARAM_VALUE.baud_clock_speed { MODELPARAM_VALUE.baud_clock_speed PARAM_VALUE.baud_clock_speed } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.baud_clock_speed}] ${MODELPARAM_VALUE.baud_clock_speed}
}

proc update_MODELPARAM_VALUE.baud_rate { MODELPARAM_VALUE.baud_rate PARAM_VALUE.baud_rate } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.baud_rate}] ${MODELPARAM_VALUE.baud_rate}
}

proc update_MODELPARAM_VALUE.parity_ena { MODELPARAM_VALUE.parity_ena PARAM_VALUE.parity_ena } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.parity_ena}] ${MODELPARAM_VALUE.parity_ena}
}

proc update_MODELPARAM_VALUE.parity_type { MODELPARAM_VALUE.parity_type PARAM_VALUE.parity_type } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.parity_type}] ${MODELPARAM_VALUE.parity_type}
}

proc update_MODELPARAM_VALUE.stop_bits { MODELPARAM_VALUE.stop_bits PARAM_VALUE.stop_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.stop_bits}] ${MODELPARAM_VALUE.stop_bits}
}

proc update_MODELPARAM_VALUE.data_bits { MODELPARAM_VALUE.data_bits PARAM_VALUE.data_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_bits}] ${MODELPARAM_VALUE.data_bits}
}

proc update_MODELPARAM_VALUE.rx_delay { MODELPARAM_VALUE.rx_delay PARAM_VALUE.rx_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.rx_delay}] ${MODELPARAM_VALUE.rx_delay}
}

proc update_MODELPARAM_VALUE.rx_baud_delay { MODELPARAM_VALUE.rx_baud_delay PARAM_VALUE.rx_baud_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.rx_baud_delay}] ${MODELPARAM_VALUE.rx_baud_delay}
}

proc update_MODELPARAM_VALUE.tx_delay { MODELPARAM_VALUE.tx_delay PARAM_VALUE.tx_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.tx_delay}] ${MODELPARAM_VALUE.tx_delay}
}

proc update_MODELPARAM_VALUE.tx_baud_delay { MODELPARAM_VALUE.tx_baud_delay PARAM_VALUE.tx_baud_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.tx_baud_delay}] ${MODELPARAM_VALUE.tx_baud_delay}
}

