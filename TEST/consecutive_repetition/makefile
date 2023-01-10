compile:
			vlib work;
			vlog -sv consecutive_repetition.sv

simulate:
	   	vsim consecutive_repetition -l c_r.log -e -do "run -all;exit;"

all:
			clear;
			vlog -sv consecutive_repetition.sv
		  vsim consecutive_repetition -l c_r.log -c -do "run -all;exit;"

clear:
			clear
