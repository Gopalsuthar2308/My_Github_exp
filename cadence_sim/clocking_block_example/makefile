compile:
	vlib work;
	vlog -sv top.sv

simulate:
	vsim top -l top.log -c -do "log -r /*; run -all;quit" -wlf waveform.wlf

all:
	make compile && make simulate

cadence_compile:
	irun -c \
		-clean \
		-elaborate \
		-coverage a \
		-access +rwc \
		-64 \
		-sv \
		-uvm \
		+access+rw \
		-sv d_flipflop.sv interface.sv test.sv top.sv \
		-l clocking_block.log \
		-top worklib.top:sv \
		-nclibdirname INCA_libs \
		-SVA

cadence_simulate:
	irun -R \
		-licqueue \
		-64 \
		-l top.log \
		-nclibdirname INCA_libs

cadence_waveform:
	irun -gui top.sv


#cadence_compile:
#	irun -c -sv top.sv -l top.log

#cadence_simulate:
#	irun -R -l top.log

#cadence_waveform:
#	irun -gui top.sv

cadence_all:
	make cadence_compile && make cadence_simulate && make cadence_waveform
