compile:
		vlib work;
		vlog -sv APB_TOP.sv
				
simulate:
	# vsim top -l top.log -c -do "run -all; exit;"
	vsim apbtb -l apbtop.log -c -do "log -r /*; add wave -r /*; run -all;quit;" -wlf waveform.wlf
	
all:
					
	 clear
		vlib work;
		vlog -sv APB_TOP.sv
	vsim  apbtb -l apbtop.log -c -do "log -r /*; add wave -r /*; run -all;quit;" -wlf waveform.wlf

clear:
		   clear
