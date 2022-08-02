# UART PUF

Respository of UART PUF cores for various fpga targets.

author: Jay Convertino   
   
date: 2022.04.25  
   
details: FPGA implemented PUF from Dr. Ratazzi wrapped in string/uart functions from open1553  
   
license: Various   
   
Special thanks to Analog Devices, their HDL build system is fantastic.   
   

![logo_img](img/logo.png)

## RELEASE VERSIONS
### Current
  - release_puf_v1 (releases are tags)
    * first release
  
### Past
  - none

## Requirements
### HDL
  - Vivado 2018.3.1 or greater (tested with Vivado 2018.3.1 and 2020.2.2) running on Linux (make and such can be used in windows, but why bother?).
  
## Quick Start
### Build HDL
1. Install Vivado 2018.3.1 or greater (make sure Vivado executable is added to your path, or create it!(alias, variable, whatever)).
2. Install build essentials package for Ubuntu.
3. From the root of the directory you may run the following build commands.
    - make all
    - make uart_puf.arty-a7-35
    - make uart_puf.cmod-s7-25
    - make uart_puf.nexys-a7-100t
4. Once completed you may use Vivado to open the project (xpr will be in the project folder root), to program your development board via JTAG.
    - Project XPR path example: projects/uart_puf/nexys-a7-100t/uart_puf_nexys-a7-100t.xpr
    - You will need to add a memory configuration device to write the bitstream to the flash of the cmod/arty/nexys.
    - cmod example at: https://reference.digilentinc.com/learn/programmable-logic/tutorials/cmod-a7-programming-guide/start?_ga=2.262285964.1885041324.1628539712-1298016575.1609856716
    
WARNING: Vivado version checks have been disabled.
    
### UART Usage
Any serial terminal program should work. This has been tested with Minicom and Putty.  

The default serial console settings (8N1) are as follows:

  - LOCAL ECHO:   ON
  - ADD LINEFEED: ON
  - BAUD:         115200
  - STOP BITS:    1
  - PARITY:       NONE
  - DATA:         8
  - FLOW CONTROL: OFF (no hardware, no software, no DTR)
  
The line feed and local echo are important. Without local echo you will not see  
what you type to send. Without line feed you will be stuck to one line that gets  
overwritten.

An example set of strings follow:  

>SELA;Hx55;  
>SELB;Hx88;  
>START;NOW;  
>ANSR;HxD4;  

Step by step:  

  1. Send SELA the value of hex 55
  2. Send SELB the value of hex 88
  3. Send START to execute processing on SELA/B values.
  4. Receive ANSR (answer) with hex value D4 (puf return value).
  
NOTICE: Once SELA or SELB is set, it stays set till SELA/B with new data is sent.  
meaning if you want to just set SELB and change values of SELA, then just set SELB  
once and only change SELA. Then issue START;NOW; to evaluate on the new SELA value  
with the previously set SELB value.

WARNING: If you type string with a mistake, it will cause issues with previous values.  
Meaning a mistake in typing start, or sela/b means you have to start all over.  
If any type field is invalid it will set tuser to 0 in the string decoder. This   
is passed to the controller. Which sees this and sets sela, selb and w to 0.  
You can use this to clear all data by just sending a carriage return.
  
## Details
### String format
Data is received in the following ASCII string format:  
>ANSR;Hx55;\r  

The fields are seperated by ; .   
  
  - The first is the type, in this case ANSR is answer and is the only type.
  - The second is the data in hex format, Hx?? where ? = 4 bits of data (8 bits in total).
  - The carrige return is the string terminator. This works well with serial consoles with local newline addition enabled.
      
Data is sent in the following ASCII string format:  
>SELA;Hx55;\r  
>SELB;HxAA;\r  
>START;NOW;\r

The string fields are seperated a by a semicolon (;) . It is also terminated by a semicolon and carriage return (ASCII 0x0D "\r").  
  
  - The first is the type. Three possible choices
    - SELA = Set PUF select A to a 8 bit value.
    - SELB = set PUF select B to a 8 bit value.
    - START = tell the puf to start processing.
  - The second is the data in hex format or filler.
    - For SELA/B data in a hex format of Hx?? where ? = 4 bits of data (8 bits in total) is sent.
    - For START a three character pad is needed. NOW works, but this is not checked, so use anything that makes you laugh.
  - The carrige return is the string terminator (DO NOT SEND LINE FEED).

### HDL
This repo contains a library folder that contains various IP cores, and projects 
that contain the code for target boards.  
Currently Supported:   

  - Digilent Arty 35T (UART DEVICE)
  - Digilent CMOD S7  (UART DEVICE)
  - Digilent Nexys A7 100t (UART DEVICE)

The original source for the HDL build system is from Analog Devices, all copyrights   
are there own and I claim no ownership of their code.

The original code has been altered and simulation capibility added.

HDL code built with Vivado 2018.3.1

Examples:  

  - Build only one particular project and its ips.  
    >make uart_puf.arty-a7-35  
  - Build all projects and ips  
    >make all  
  - Build all with a different vivado command line then default.  
    >make all VIVADO="/opt/Xilinx/Vivado/2020.2/bin/vivado -mode batch -source"  

See IP core folder in the library folder for details on simulation and usage.
