# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_CLK_DIV [ipgui::add_param $IPINST -name "C_CLK_DIV" -parent ${Page_0}]
  set_property tooltip {Clock in Freq / Clock divisor < 40 MHz} ${C_CLK_DIV}
  set C_RESET_ACTIVE [ipgui::add_param $IPINST -name "C_RESET_ACTIVE" -parent ${Page_0}]
  set_property tooltip {Reset Active} ${C_RESET_ACTIVE}


}

proc update_PARAM_VALUE.C_CLK_DIV { PARAM_VALUE.C_CLK_DIV } {
	# Procedure called to update C_CLK_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLK_DIV { PARAM_VALUE.C_CLK_DIV } {
	# Procedure called to validate C_CLK_DIV
	return true
}

proc update_PARAM_VALUE.C_RESET_ACTIVE { PARAM_VALUE.C_RESET_ACTIVE } {
	# Procedure called to update C_RESET_ACTIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_RESET_ACTIVE { PARAM_VALUE.C_RESET_ACTIVE } {
	# Procedure called to validate C_RESET_ACTIVE
	return true
}


proc update_MODELPARAM_VALUE.C_RESET_ACTIVE { MODELPARAM_VALUE.C_RESET_ACTIVE PARAM_VALUE.C_RESET_ACTIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_RESET_ACTIVE}] ${MODELPARAM_VALUE.C_RESET_ACTIVE}
}

proc update_MODELPARAM_VALUE.C_CLK_DIV { MODELPARAM_VALUE.C_CLK_DIV PARAM_VALUE.C_CLK_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLK_DIV}] ${MODELPARAM_VALUE.C_CLK_DIV}
}

