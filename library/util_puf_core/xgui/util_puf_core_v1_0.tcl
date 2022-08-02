# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RO_sel" -parent ${Page_0}
  ipgui::add_param $IPINST -name "delay_clk" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ro_PUF_width" -parent ${Page_0}


}

proc update_PARAM_VALUE.RO_sel { PARAM_VALUE.RO_sel } {
	# Procedure called to update RO_sel when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RO_sel { PARAM_VALUE.RO_sel } {
	# Procedure called to validate RO_sel
	return true
}

proc update_PARAM_VALUE.delay_clk { PARAM_VALUE.delay_clk } {
	# Procedure called to update delay_clk when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.delay_clk { PARAM_VALUE.delay_clk } {
	# Procedure called to validate delay_clk
	return true
}

proc update_PARAM_VALUE.ro_PUF_width { PARAM_VALUE.ro_PUF_width } {
	# Procedure called to update ro_PUF_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ro_PUF_width { PARAM_VALUE.ro_PUF_width } {
	# Procedure called to validate ro_PUF_width
	return true
}


proc update_MODELPARAM_VALUE.delay_clk { MODELPARAM_VALUE.delay_clk PARAM_VALUE.delay_clk } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.delay_clk}] ${MODELPARAM_VALUE.delay_clk}
}

proc update_MODELPARAM_VALUE.ro_PUF_width { MODELPARAM_VALUE.ro_PUF_width PARAM_VALUE.ro_PUF_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ro_PUF_width}] ${MODELPARAM_VALUE.ro_PUF_width}
}

proc update_MODELPARAM_VALUE.RO_sel { MODELPARAM_VALUE.RO_sel PARAM_VALUE.RO_sel } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RO_sel}] ${MODELPARAM_VALUE.RO_sel}
}

