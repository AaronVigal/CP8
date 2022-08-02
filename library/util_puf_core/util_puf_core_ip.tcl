################################################################################
## IP CREATION SCRIPT FOR VIVADO
################################################################################

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

set design   util_puf_core
set ven_addr "afrl.mil"
set ven_name "AFRL RIGB"
set lib      "/AFRL_RIGB_HDL"
set lib_grp  "puf"
set ven_url  "https://www.afrl.mil"
set descript "PUF"

adi_ip_create $design
adi_ip_files  $design [list \
  "constr/util_puf_core_constr.xdc" \
  "src/five_stage_ro.vhd" \
  "src/PUF_Array.vhd" \
  "src/PUF_Bit.vhd" \
  "src/PUF_Comparator.vhd" \
  "src/PUF_Counter.vhd" \
  "src/PUF_Decoder.vhd" \
  "src/PUF_Machine.vhd" \
  "src/PUF_Mux.vhd" \
  "src/RO_Array.vhd" \
  "src/PUF_Main.vhd" ]

set_property target_language VHDL [current_project]
  
adi_ip_properties_lite $design

#change defaults from above function to our own.
ipx::package_project -root_dir . -vendor $ven_addr -library user -taxonomy $lib
set_property name $design [ipx::current_core]
set_property vendor_display_name $ven_name [ipx::current_core]
set_property company_url $ven_url [ipx::current_core]

ipx::remove_all_bus_interface [ipx::current_core]

ipx::save_core [ipx::current_core]


