all:
	make clear;make compile;make simulate

compile:
	vlib work;
	vlog -sv string_reverse.sv

simulate:
	vsim string_reverse -l string_reverse.log -c -do "run -all;quit;"

clear:
	clear

