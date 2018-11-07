# DOP - main framework
Design Operation Platform (dop) is the root project of IC Design Management Framework.

It is composed of the followng modules:

	* dvc - Design Version Control
	* dqi - Design Quality Indicator
	* dcm - Design Collateral Management
	* dfa - Design Flow Automation


## Project Code Naming Rule

	Format : tfppccr
	
	* t - project type
			P - Platform project
			R - RLT to GDS
			N - Netlist to GDS
			G - GDS tapeout
			T - Turnkey Production
	
	* f - foundry code
	
			1: TSMC
			2: UMC
			3: SMIC
			4: Global Foundries
			5: Samsung Foundry
			X: Others

	* pp - process node
	
			05: 0.500um	500nm
			06: 0.350um	250nm
			07: 0.180um	180nm
			08: 80nm
			09: 90nm
			10: 65nm/55nm
				11 -	65G
				12 -	65LP
				15 -	55LP

			20: 45nm/40nm
				21 -	45G
				25 -	40G
				26 -	40LP
				27 -	40ULP
			30: 32nm/28nm/22nm
				31 -	28LP
				32 -	28HP
				33 -	28HPL
				34 -	28HPM
				35 -	28HPC
				36 -	28ULP
			40: 20nm
				41 -	20FF
				42 -	20FDSOI
			50: 16nm/14nm/12nm
				51 -	16FF+
				52 -	16FFC
				55 -	12FFC
			60: 10nm/8nm
				61 -	10FF
			70: 7nm
				71 -	7FF
			80: 5nm
			90: 3nm

	* cc - project count
	
			T1: CAD team testchip project
			I1: internal IP develeopment project
			01: customer project

	* r   - revision
	
			A - rev0
			B - eco1
			C - eco2 


## Project Accont Naming Rule

	Example :
	Project code - N13301A 

	- Project User Group
	
		- n13301ua : Project Manager Group 
		- n13301ub : Backend Group (APR)
		- n13301uc : CAD Group (Library/Design Kit/EDA Tool/Memory Compiler)
		- n13301ud : Data Management Group
		- n13301ue : IP RD Engineering Group
		- n13301uf : Frontend Group (RTL Coding, Synthesis, Simulation, DFT)

	- Project User Account
	
		- n13301ua0 : Project Manager
			- n13301ua1 : FAE 1
			- n13301ua2 : FAE 2
		- n13301ub0 : Project Technical Lead (Backend)
			- n13301ub1 : block APR owner 1
			- n13301ub2 : block APR owner 2
		- n13301uc0 : Library/Design Kit Manager
			- n13301uc1 : CAD flow script owner 1
			- n13301uc2 : CAD flow script owner 2
		- n13301ud0 : Design Data Management
		- n13301ue0 : Project Technincal Lead (IP RD)
			- u13301ue1 : IP RD owner 1 (DDR)
			- u13301ue2 : IP RD owner 2 (GPIO)
		- n13301uf0 : Project Technical Lead (Frontend)
			- n13301uf1 : block RTL owner 1
			- n13301uf2 : block RTL owner 2


## Project Unix Directory 

 	- Project Root Directory
	
		PROJHOME = /project/N13301A
		
	- Project Central Data Directory 
	
		$PROJHOME/techlib/		: n13301uc0
		$PROJHOME/design/		: n13301ud0
		$PROJHOME/flow/			: n13301uc?

	- Project User Working Directory 
	
		$PROJHOME/users/n13301ua0/	: n13301ua0
		$PROJHOME/users/n13301ub0/	: n13301ub0
		$PROJHOME/users/n13301ub1/	: n13301ub1
		....
 
## Project User Account Management

	1. Separate regualr user account and project user account
		regular user account - brianli
		project user account - n13301ua0

		* project design data should be kept in project execution environment under project accounts.

		* Project user account assigmentment table:
		
			n13301ua0 : albertli
			n13301ub0 : kevinwu
			n13301ub1 : mattwu
			n13301uc0 : susanho
			n13301ud0 : brianli
	
	2. Login to regular user account and then rsh/ssh to project account

		* use $HOME/.rhosts to control which user can login to specific project account
	
		Example: 
			/projects/N13301A/users/n13301ua0/.rhosts
			+ albertli

	3. Execute data management & design implementation job from associate project user account

		* all unix job actions should be recorded into tracking database
		* machine resource and tool license usage should be recorded  
		
## Data Management Rule

	1) Only FDK kit owner (uc0) can install the library file into techlib/
	2) Only neccessary design data should be checkin to central database pool and use formal DVC command only
	3) Design data should be checkout from central pool to local working directory before executing implementation job

