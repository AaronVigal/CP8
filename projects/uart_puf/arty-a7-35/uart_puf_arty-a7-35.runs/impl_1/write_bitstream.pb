
j
Command: %s
53*	vivadotcl29
%write_bitstream -force system_top.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "?
Li_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_2_n_0Li_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_2_n_02default:default2default:default2?
 "?
Ji_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_2/OJi_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_2/O2default:default2default:default2?
 "?
Hi_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_2	Hi_system_wrapper/system_i/util_uart_puf/inst/puf/state_mac/valid_reg_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
bNo routable loads: 8192 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2?
 "?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[174].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[174].ROX/r_ring_oscillator2default:default"?
si_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[0].pufX/Ro_Ar/GEN_RO[54].ROX/r_ring_oscillator[3:0]ni_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[0].pufX/Ro_Ar/GEN_RO[54].ROX/r_ring_oscillator2default:default"?
si_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[17].ROX/r_ring_oscillator[3:0]ni_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[17].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[179].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[179].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[2].pufX/Ro_Ar/GEN_RO[140].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[2].pufX/Ro_Ar/GEN_RO[140].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[178].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[178].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[1].pufX/Ro_Ar/GEN_RO[124].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[1].pufX/Ro_Ar/GEN_RO[124].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[177].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[177].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[176].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[176].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[1].pufX/Ro_Ar/GEN_RO[123].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[1].pufX/Ro_Ar/GEN_RO[123].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[175].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[175].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[5].pufX/Ro_Ar/GEN_RO[184].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[5].pufX/Ro_Ar/GEN_RO[184].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[173].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[173].ROX/r_ring_oscillator2default:default"?
ti_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[172].ROX/r_ring_oscillator[3:0]oi_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[4].pufX/Ro_Ar/GEN_RO[172].ROX/r_ring_oscillator2default:default"?
si_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[2].pufX/Ro_Ar/GEN_RO[68].ROX/r_ring_oscillator[3:0]ni_system_wrapper/system_i/util_uart_puf/inst/puf/puf_ar/GEN_puf[2].pufX/Ro_Ar/GEN_RO[68].ROX/r_ring_oscillator2default:..."1
(the first 15 of 2048 listed)2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px? 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 3 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
82default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
f
%Bitstream compression saved %s bits.
26*	bitstream2
133186882default:defaultZ40-26h px? 
a
Writing bitstream %s...
11*	bitstream2$
./system_top.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
?
?'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2?
?/home/ace-intern/Desktop/CPs/CP8/challenge/lecture-week-9-hardware-security-intern/Challenge/PUF_HDL/projects/uart_puf/arty-a7-35/uart_puf_arty-a7-35.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Mon Aug  1 13:46:11 20222default:default2M
9/tools/Xilinx/Vivado/2020.2/doc/webtalk_introduction.html2default:defaultZ17-186h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
132default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:112default:default2
00:00:142default:default2
3264.5232default:default2
219.0822default:default2
5092default:default2
87102default:defaultZ17-722h px? 


End Record