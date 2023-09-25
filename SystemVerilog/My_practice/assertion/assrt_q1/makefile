compile:
	vlib work;
	vlog -sv \
	+acc \
	+cover \
	+fcover \
	-l test.log \
	assrt_q1.sv

simulate:
	vsim -vopt \
	work.assertion_test \
	-voptargs=+acc=npr \
	-assertdebug \
	-l test_simulate.log \
	-sva \
  -coverage \
	-c -do "log -r /*; add wave -r /*; coverage save -onexit -assert -directive -cvg -codeAll coverage.ucdb; run -all; exit" \
	-wlf waveform.wlf
	#vsim assertion_test -l top.log -c -do "log -r /*; run -all;quit;" -wlf waveform.wlf

all:
	make compile && make simulate
