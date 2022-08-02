####################################################################################
####################################################################################
## Original By Analog Devices
## Update   By Jay Convertino
## MAKEFILE
####################################################################################
####################################################################################

include ../quiet.mk

.PHONY: all lib clean clean-all
all: lib


clean:
	$(MAKE) -C util_puf_core clean
	$(MAKE) -C util_axis_puf_controller clean
	$(MAKE) -C util_axis_puf_string_encoder clean
	$(MAKE) -C util_axis_puf_string_decoder clean
	$(MAKE) -C util_axis_char_to_string_converter clean
	$(MAKE) -C util_axis_data_width_converter clean
	$(MAKE) -C util_axis_tiny_fifo clean
	$(MAKE) -C util_axis_uart clean
	$(MAKE) -C util_uart_puf_core clean
	$(MAKE) -C util_axis_xfifo clean
	$(MAKE) -C util_fifo clean
	
	$(MAKE) -C interfaces clean

clean-all:clean


lib:
	$(MAKE) -C util_puf_core
	$(MAKE) -C util_axis_puf_controller
	$(MAKE) -C util_axis_puf_string_encoder
	$(MAKE) -C util_axis_puf_string_decoder
	$(MAKE) -C util_axis_char_to_string_converter
	$(MAKE) -C util_axis_data_width_converter
	$(MAKE) -C util_axis_tiny_fifo
	$(MAKE) -C util_axis_uart
	$(MAKE) -C util_uart_puf_core
	$(MAKE) -C util_axis_xfifo
	$(MAKE) -C util_fifo
	
	$(MAKE) -C interfaces
####################################################################################
####################################################################################
