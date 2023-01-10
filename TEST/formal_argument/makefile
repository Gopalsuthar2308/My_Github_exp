compile:
			vlib work;
			vlog -sv formal_argument.sv

simulate:
	   	vsim formal_argument -l formal_argument.log -c -do "run -all;exit;"

all:
			clear;
			vlog -sv formal_argument.sv
		  vsim formal_argument -l formal_argument.log -c -do "run -all;exit;"

clear:
			clear
