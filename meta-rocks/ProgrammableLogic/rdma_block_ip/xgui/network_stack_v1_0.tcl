# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH"
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH"
  ipgui::add_param $IPINST -name "DEFAULT_IP_ADDRESS"
  ipgui::add_param $IPINST -name "DEFAULT_MAC_ADDRESS"

}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DEFAULT_IP_ADDRESS { PARAM_VALUE.DEFAULT_IP_ADDRESS } {
	# Procedure called to update DEFAULT_IP_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_IP_ADDRESS { PARAM_VALUE.DEFAULT_IP_ADDRESS } {
	# Procedure called to validate DEFAULT_IP_ADDRESS
	return true
}

proc update_PARAM_VALUE.DEFAULT_MAC_ADDRESS { PARAM_VALUE.DEFAULT_MAC_ADDRESS } {
	# Procedure called to update DEFAULT_MAC_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_MAC_ADDRESS { PARAM_VALUE.DEFAULT_MAC_ADDRESS } {
	# Procedure called to validate DEFAULT_MAC_ADDRESS
	return true
}


