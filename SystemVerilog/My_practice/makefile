compile:
	vlib work;
	vlog -sv conditional.sv
	
simulate:
	vsim conditional -l conditional.log -c -do "run -all; exit;"
	
all:
	make clear;
	make compile;
	make simulate;
	
clear:
	   clear
