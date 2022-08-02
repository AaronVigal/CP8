# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ACK_ENA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BYTE_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_DELAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_ENA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COUNT_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_ZERO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DC_SYNC_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FWFT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RAM_TYPE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RD_SYNC_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WR_SYNC_DEPTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ACK_ENA { PARAM_VALUE.ACK_ENA } {
	# Procedure called to update ACK_ENA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACK_ENA { PARAM_VALUE.ACK_ENA } {
	# Procedure called to validate ACK_ENA
	return true
}

proc update_PARAM_VALUE.BYTE_WIDTH { PARAM_VALUE.BYTE_WIDTH } {
	# Procedure called to update BYTE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BYTE_WIDTH { PARAM_VALUE.BYTE_WIDTH } {
	# Procedure called to validate BYTE_WIDTH
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

proc update_PARAM_VALUE.DATA_ZERO { PARAM_VALUE.DATA_ZERO } {
	# Procedure called to update DATA_ZERO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_ZERO { PARAM_VALUE.DATA_ZERO } {
	# Procedure called to validate DATA_ZERO
	return true
}

proc update_PARAM_VALUE.DC_SYNC_DEPTH { PARAM_VALUE.DC_SYNC_DEPTH } {
	# Procedure called to update DC_SYNC_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DC_SYNC_DEPTH { PARAM_VALUE.DC_SYNC_DEPTH } {
	# Procedure called to validate DC_SYNC_DEPTH
	return true
}

proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to update FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to validate FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.FWFT { PARAM_VALUE.FWFT } {
	# Procedure called to update FWFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FWFT { PARAM_VALUE.FWFT } {
	# Procedure called to validate FWFT
	return true
}

proc update_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to update RAM_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RAM_TYPE { PARAM_VALUE.RAM_TYPE } {
	# Procedure called to validate RAM_TYPE
	return true
}

proc update_PARAM_VALUE.RD_SYNC_DEPTH { PARAM_VALUE.RD_SYNC_DEPTH } {
	# Procedure called to update RD_SYNC_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_SYNC_DEPTH { PARAM_VALUE.RD_SYNC_DEPTH } {
	# Procedure called to validate RD_SYNC_DEPTH
	return true
}

proc update_PARAM_VALUE.WR_SYNC_DEPTH { PARAM_VALUE.WR_SYNC_DEPTH } {
	# Procedure called to update WR_SYNC_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_SYNC_DEPTH { PARAM_VALUE.WR_SYNC_DEPTH } {
	# Procedure called to validate WR_SYNC_DEPTH
	return true
}


proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.BYTE_WIDTH { MODELPARAM_VALUE.BYTE_WIDTH PARAM_VALUE.BYTE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BYTE_WIDTH}] ${MODELPARAM_VALUE.BYTE_WIDTH}
}

proc update_MODELPARAM_VALUE.COUNT_WIDTH { MODELPARAM_VALUE.COUNT_WIDTH PARAM_VALUE.COUNT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_WIDTH}] ${MODELPARAM_VALUE.COUNT_WIDTH}
}

proc update_MODELPARAM_VALUE.FWFT { MODELPARAM_VALUE.FWFT PARAM_VALUE.FWFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FWFT}] ${MODELPARAM_VALUE.FWFT}
}

proc update_MODELPARAM_VALUE.RD_SYNC_DEPTH { MODELPARAM_VALUE.RD_SYNC_DEPTH PARAM_VALUE.RD_SYNC_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_SYNC_DEPTH}] ${MODELPARAM_VALUE.RD_SYNC_DEPTH}
}

proc update_MODELPARAM_VALUE.WR_SYNC_DEPTH { MODELPARAM_VALUE.WR_SYNC_DEPTH PARAM_VALUE.WR_SYNC_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_SYNC_DEPTH}] ${MODELPARAM_VALUE.WR_SYNC_DEPTH}
}

proc update_MODELPARAM_VALUE.DC_SYNC_DEPTH { MODELPARAM_VALUE.DC_SYNC_DEPTH PARAM_VALUE.DC_SYNC_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DC_SYNC_DEPTH}] ${MODELPARAM_VALUE.DC_SYNC_DEPTH}
}

proc update_MODELPARAM_VALUE.COUNT_DELAY { MODELPARAM_VALUE.COUNT_DELAY PARAM_VALUE.COUNT_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_DELAY}] ${MODELPARAM_VALUE.COUNT_DELAY}
}

proc update_MODELPARAM_VALUE.COUNT_ENA { MODELPARAM_VALUE.COUNT_ENA PARAM_VALUE.COUNT_ENA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_ENA}] ${MODELPARAM_VALUE.COUNT_ENA}
}

proc update_MODELPARAM_VALUE.DATA_ZERO { MODELPARAM_VALUE.DATA_ZERO PARAM_VALUE.DATA_ZERO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_ZERO}] ${MODELPARAM_VALUE.DATA_ZERO}
}

proc update_MODELPARAM_VALUE.ACK_ENA { MODELPARAM_VALUE.ACK_ENA PARAM_VALUE.ACK_ENA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACK_ENA}] ${MODELPARAM_VALUE.ACK_ENA}
}

proc update_MODELPARAM_VALUE.RAM_TYPE { MODELPARAM_VALUE.RAM_TYPE PARAM_VALUE.RAM_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RAM_TYPE}] ${MODELPARAM_VALUE.RAM_TYPE}
}

