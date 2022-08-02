# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BUS_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_DELAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_ENA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEST_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PACKET_MODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RAM_TYPE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USER_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.BUS_WIDTH { PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to update BUS_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUS_WIDTH { PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to validate BUS_WIDTH
	return true
}

proc update_PARAM_VALUE.COUNT_DELAY { PARAM_VALUE.COUNT_DELAY } {
	# Procedure called to update COUNT_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNT_DELAY { PARAM_VALUE.COUNT_DELAY } {
	# Procedure called to validate COUNT_DELAY
	return true
}

proc update_PARAM_VALUE.COUNT_ENA { PARAM_VALUE.COUNT_ENA } {
	# Procedure called to update COUNT_ENA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNT_ENA { PARAM_VALUE.COUNT_ENA } {
	# Procedure called to validate COUNT_ENA
	return true
}

proc update_PARAM_VALUE.COUNT_WIDTH { PARAM_VALUE.COUNT_WIDTH } {
	# Procedure called to update COUNT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNT_WIDTH { PARAM_VALUE.COUNT_WIDTH } {
	# Procedure called to validate COUNT_WIDTH
	return true
}

proc update_PARAM_VALUE.DEST_WIDTH { PARAM_VALUE.DEST_WIDTH } {
	# Procedure called to update DEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEST_WIDTH { PARAM_VALUE.DEST_WIDTH } {
	# Procedure called to validate DEST_WIDTH
	return true
}

proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to update FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to validate FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.PACKET_MODE { PARAM_VALUE.PACKET_MODE } {
	# Procedure called to update PACKET_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PACKET_MODE { PARAM_VALUE.PACKET_MODE } {
	# Procedure called to validate PACKET_MODE
	return true
}

proc update_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to update RAM_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to validate RAM_TYPE
	return true
}

proc update_PARAM_VALUE.USER_WIDTH { PARAM_VALUE.USER_WIDTH } {
	# Procedure called to update USER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USER_WIDTH { PARAM_VALUE.USER_WIDTH } {
	# Procedure called to validate USER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.COUNT_WIDTH { MODELPARAM_VALUE.COUNT_WIDTH PARAM_VALUE.COUNT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_WIDTH}] ${MODELPARAM_VALUE.COUNT_WIDTH}
}

proc update_MODELPARAM_VALUE.BUS_WIDTH { MODELPARAM_VALUE.BUS_WIDTH PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUS_WIDTH}] ${MODELPARAM_VALUE.BUS_WIDTH}
}

proc update_MODELPARAM_VALUE.USER_WIDTH { MODELPARAM_VALUE.USER_WIDTH PARAM_VALUE.USER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USER_WIDTH}] ${MODELPARAM_VALUE.USER_WIDTH}
}

proc update_MODELPARAM_VALUE.DEST_WIDTH { MODELPARAM_VALUE.DEST_WIDTH PARAM_VALUE.DEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEST_WIDTH}] ${MODELPARAM_VALUE.DEST_WIDTH}
}

proc update_MODELPARAM_VALUE.RAM_TYPE { MODELPARAM_VALUE.RAM_TYPE PARAM_VALUE.RAM_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RAM_TYPE}] ${MODELPARAM_VALUE.RAM_TYPE}
}

proc update_MODELPARAM_VALUE.PACKET_MODE { MODELPARAM_VALUE.PACKET_MODE PARAM_VALUE.PACKET_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PACKET_MODE}] ${MODELPARAM_VALUE.PACKET_MODE}
}

proc update_MODELPARAM_VALUE.COUNT_DELAY { MODELPARAM_VALUE.COUNT_DELAY PARAM_VALUE.COUNT_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_DELAY}] ${MODELPARAM_VALUE.COUNT_DELAY}
}

proc update_MODELPARAM_VALUE.COUNT_ENA { MODELPARAM_VALUE.COUNT_ENA PARAM_VALUE.COUNT_ENA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_ENA}] ${MODELPARAM_VALUE.COUNT_ENA}
}

