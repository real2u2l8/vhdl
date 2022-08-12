fa_tb : fa.vhd fa_tb.vhd
	ghdl -a $^
	ghdl -e $@
	ghdl -r $@ --stop-time=160ns --wave=$@.ghw
	gtkwave $@.ghw