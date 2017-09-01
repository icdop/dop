#
# publish dop.tcl to lib/
publish: 
	cp lib/dop.tcl ../lib/dop.tcl

# concat tcl script to lib/dop.tcl
merge:
	bin/genlib.tcl -cfg genlib.cfg -o lib/dop.tcl 

# split dop.tcl to individual tcl file
split:
	bin/split.tcl lib/dop.tcl


