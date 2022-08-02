### ring oscilator ###

### the below is for combinartoral loops causing a race condition error ###
### some google searches later, this seems to be the best option, though I wonder if get_nets could just filter out by name? ###
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells -filter {NAME =~ */util_uart_puf/inst/puf/puf_ar/GEN_puf[*].pufX/Ro_Ar/GEN_RO[*].ROX/r_ring_oscillator_inferred_i_*} -hier]]
