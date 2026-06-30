# DOP - main framework
Design Operation Platform (dop) is the root project of IC Design Management Framework.

It is composed of the followng modules:

	* tlm - Technical Library Management
	* dvc - Design Version Control
	* dqr - Design Quality Review
	* dfa - Design Flow Automation

	
## Create Project Unix Directory
	- Project Root Directory
		PRJ_ROOT = /project/N13301A
		
	- Project Central Data Directory 
		$PRJ_ROOT/techlib/		: n13301uc0
		$PRJ_ROOT/design/		: n13301ud0
		$PRJ_ROOT/flow/		: n13301uc0

	- Project User Working Directory 
		$PRJ_ROOT/users/n13301ua0/	: n13301ua0
		$PRJ_ROOT/users/n13301ub0/	: n13301ub0
		$PRJ_ROOT/users/n13301ub1/	: n13301ub1
		....
		
## Data Management Rule
	1) Only FDK kit owner (uc0) can install the library file into techlib/
	2) Only neccessary design data should be checkin to central database pool and use formal DVC command only
	3) Design data should be checkout from central pool to local working directory before executing implementation job

## Prepare Design Ticket
<pre>
# Flow Ticket file (T400-XXXX.ticket)
[HEADER]
TITLE   =  description of the flow ticket
TECHLIB =  <i>techlib_config_file</i>
DESIGN  =  <i>top_module_name</i>
DVC_SRC =  <i>design_source_version_path</i>
DVC_DST =  <i>design_dest_version_path</i>

FLOW_ID =  <i>flow_reference_id</i>:<i>ticket_run_dir</i>

[INPUT]
<i>input_ref_id1</i>  = <i>input_file_name</i>
<i>input_ref_id2</i>  = <i>input_dir_name</i>

[OUTPUT]
<i>output_ref_id1</i> = <i>output_file_name</i>
<i>output_ref_id2</i> = <i>output_dir_name</i>

[PARAM]
<i>parameter_id1</i>  = <i>parameter_value1</i>
<i>parameter_id2</i>  = <i>parameter_value2</i>
...

</pre>
<hr>
<pre>

