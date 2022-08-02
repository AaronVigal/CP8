####################################################################################
## Jay Convertino
## AD_HDL FPGA MAKEFILE MODIFIED FOR SIM_GEN SYSTEM
## 2022.04.21
####################################################################################

CURRENT_DIR = $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
PROJ_NAME := $(if $(LIBRARY_NAME),$(LIBRARY_NAME),$(notdir $(patsubst %/,%,$(CURRENT_DIR))))

LIBRARY_NAME := $(PROJ_NAME)

# GHDL generic make file
ENTITY   = tb_puf_core
LIB_NAME = work
STOP_TIME= 100ns
STD      = 93
IEEE_STD = standard

SRC_DIR = src
TB_DIR  = tb

CLEAN_TARGET += *.log

GENERIC_DEPS += $(wildcard $(SRC_DIR)/*.vhd)

TB_DEPS = $(wildcard $(TB_DIR)/*.vhd)

XILINX_DEPS += util_puf_core_ip.tcl

include ../scripts/library.mk
#include ../scripts/sim_gen_ghdl.mk
#include ../scripts/sim_gen_modelsim.mk
include ../scripts/sim_gen_xsim.mk
#include ../scripts/doc_gen_doxygen.mk
include ../scripts/sim_gen_clean.mk
