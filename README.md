# dop - main framework
Design Operation Platform (dop) is the root projejct of IC Design Management Framework.

It is composed of the followng modules:
* dkm - Design Kit Management
* dvc - Design Version Control
* dfa - Design Flow Automation
* dqr - Design Quality Review

## Project Accont Management

1) Project Code Naming Rule

	Format : Pffppp###r

	* ff - foundry code
	
			10: TSMC
			11: UMC
			12: SMIC
			13: Samsun
			14: Global Foundries

	* pp - process node
	
			10: 0.500um	500nm
			20: 0.350um	250nm
			30: 0.180um	180nm
			40: 90nm/80nm
			50: 65nm/55nm
				51 -	65G
				52 -	65LP
				53 -	55LP

			60: 45nm/40nm
				61 -	45G
				62 -	40G
				63 -	40LP
				64 -	40ULP
			70: 32nm/28nm
				71 -	28LP
				72 -	28HP
				73 -	28HPL
				74 -	28HPM
				75 -	28HPC
				76 -	28ULP
			80: 20nm
				81 -	20FF
			90: 16nm
				91 -	16FF+
				92 -	16FFC
				93 -	12FFC
			A0: 10nm
				A1 -	10FF
			B0: 7nm
				B1 -	7FF
			C00: 5nm
			D00: 3nm

	* ### - project count
	
			T01: CAD team testchip project
			I01: internal IP develeopment project
			C01: customer project

	* r   - revision
	
			A - rev0
			B - eco1
			C - eco2 


2) Project Unix Environment Setup 

	Example : 
	Project code : P1073C01A 

	- Project Unix Group
	
		- p1073c01d : Design Data Management Group
		- p1073c01a : PM/AE Group 
		- p1073c01b : Backend Group (APR)
		- p1073c01c : CAD Group (Library/Design Kit/EDA Tool)
		- p1073c01e : IP Group
		- p1073c01f : Frontend Group (RTL Coding, Synthesis, Simulation, DFT)
		- p1073c01m : Memory Group (Memory Compiler)

	- Project Unix Account
	
		- p1073c01a : Project Data Management Account
		- p1073c01a0 : Project Leader
		- p1073c01c0 : CAD/Design Kit Engineer
		- p1073c01b0 : Backend Leader/Full chip integration
			- p1073c01b1 : block APR owner 1
			- p1073c01b2 : block APR owner 2
		- p1073c01f0 : Frondend Leader
			- p1073c01f1 : block RTL owern 1 
			- p1073c01f2 : DFT owner
		- p1073c01e0 : IP Dev Lead
			- p1073c01e1 : DDR IP RD
			- p1073c01e2 : GPIO RD

	- Project Working Directory
	
		Directory				  ower
		-------------------------------		----------
		/projects/p1073c01/design/		: p1073c01


		/projects/p1073c01/techlib/		: p1073c01c0
		/projects/p1073c01/flow/		: p1073c01c0
	
		/projects/p1073c01/user/pm0/		: p1073c01a0
		/projects/p1073c01/user/be0/		: p1073c01b0
		/projects/p1073c01/user/be1/		: p1073c01b1
		/projects/p1073c01/user/fe0/		: p1073c01f0
		/projects/p1073c01/user/fe1/		: p1073c01f1
		/projects/p1073c01/user/ip0/		: p1073c01e0
		/projects/p1073c01/user/ip1/		: p1073c01e1
		/projects/p1073c01/user/cad/		: p1073c01c0
		/projects/p1073c01/user/mem/		: p1073c01m0
 


3) Project Account Management

	1. Separate regualr user account and project account
		regular account - albertli
		project user account - p1073c01a0

		* project design data should be kept in project execution environment under project accounts.

		
	2. Login to regular user account and then rsh/ssh to project account

		* use ~/.rhosts to control which user can login to which project accounts
	
		Example: 
			/projects/p1073c01/users/pm0/.rhosts
			+ brianli
			+ kevinwu

	3. Execute data management & design implementation job from associate project account

		* all unix job actions should be recorded into tracking database
		* machine resource and tool license usage should be recorded  
		
4) Data Management Rule

	1) Only CAD engineer can install the library file into techlib/
	2) Design data can only be checkin to central database pool with formal DVC command 
	3) Design data should be checkout from central pool to local working directory before executing implementation job

