# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/system_constr.xdc

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/common/nexys-a7-100t/nexys-a7-100t_system_constr.xdc

# Block Designs: bd/system/system.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system || ORIG_REF_NAME==system} -quiet] -quiet

# IP: bd/system/ip/system_clk_wiz_48mhz_0/system_clk_wiz_48mhz_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_clk_wiz_48mhz_0 || ORIG_REF_NAME==system_clk_wiz_48mhz_0} -quiet] -quiet

# IP: bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_sys_rstgen_0 || ORIG_REF_NAME==system_sys_rstgen_0} -quiet] -quiet

# IP: bd/system/ip/system_util_uart_puf_0/system_util_uart_puf_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==system_util_uart_puf_0 || ORIG_REF_NAME==system_util_uart_puf_0} -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_clk_wiz_48mhz_0/system_clk_wiz_48mhz_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_clk_wiz_48mhz_0 || ORIG_REF_NAME==system_clk_wiz_48mhz_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_clk_wiz_48mhz_0/system_clk_wiz_48mhz_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_clk_wiz_48mhz_0 || ORIG_REF_NAME==system_clk_wiz_48mhz_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_clk_wiz_48mhz_0/system_clk_wiz_48mhz_0_ooc.xdc

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_sys_rstgen_0 || ORIG_REF_NAME==system_sys_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_sys_rstgen_0/system_sys_rstgen_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_sys_rstgen_0 || ORIG_REF_NAME==system_sys_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_util_uart_puf_0/constr/util_puf_core_constr.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_util_uart_puf_0 || ORIG_REF_NAME==system_util_uart_puf_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/ip/system_util_uart_puf_0/constr/util_fifo_constr.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_util_uart_puf_0 || ORIG_REF_NAME==system_util_uart_puf_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/CP8/projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.gen/sources_1/bd/system/system_ooc.xdc