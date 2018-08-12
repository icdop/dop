# dop - main framework
Design Operation Platform (dop) is the root projejct of IC Design Management Framework.

It is composed of the followng modules:
* dkm - Design Kit Management
* dvc - Design Version Control
* dfa - Design Flow Automation
* dqr - Design Quality Review

## Project Accont Management

1) Project Code Naming Rule

	Format : P<f><ppp><###><r>

	* abc - process code
		a - foundry code
			1: TSMC
			2: Samsung
			3: Global Foundries
			4: UMC
			5: SMIC

		ppp - process node (major)
			010: 0.50um	500nm
			020: 0.350um	250nm
			030: 0.180um	180nm
			040: 90nm/80nm
			050: 65nm/55nm
				051 -	65G
				052 -	65LP
				151 -	55LP

			060: 45nm/40nm
				061 -	45G
				162 -	40G
				162 -	40LP
				163 -	40ULP
			070: 28nm
				071 -	28LP
				072 -	28HP
				073 -	28HPM
				074 -	28HPC
				075 -	28ULP
			080: 20nm
				081 -	20FF
			090: 16nm
				091 -	16FF+
				092 -	16FFC
				191 -	12FFC
			0A0: 10nm
				0A1 -	10FF
			0B0: 7nm
				0B1 -	7FF
			0C0: 5nm
			0D0: 3nm

	* ### - project count
			T01: CAD team testchip project
			I01: internal IP develeopment project
			001: customer project

	* r   - revision
			a - rev0
			b - eco1
			c - eco2 


2) Project Unix Environment Setup 

	Example : 
	Project code p1073001a 

	- Project Unix Group
		- p1073001a  : Project Data Management Group
		- p1073001aa : PM/AE Group 
		- p1073001ab : Backend Group (APR)
		- p1073001ac : CAD Group (Library/Design Kit/EDA Tool)
		- p1073001ad : DFT Group
		- p1073001ae : IP Group
		- p1073001af : Frontend Group (RTL Coding, Synthesis, Simulation)
		- p1073001am : Memory Group (Memory Compiler)

	- Project Unix Account
		- p107300aa : Project Data Management Account
		- p1073001aa0 : Project Leader
		- p1073001ac0 : CAD/Design Kit Engineer
		- p1073001ab0 : Backend Leader/Full chip integration
			- p1073001ab1 : block APR owner 1
			- p1073001ab2 : block APR owner 2
		- p1073001ad0 : DFT Leader/Full chip DFT
			- p1073001d1  : block DFT owner 1
		- p1073001af0 : Frondend Leader
			- p1073001af1 : block RTL owern 1 
		- p1073001ae0 : IP Dev Lead
			- p1073001ae1 : DDR IP RD
			- p1073001ae2 : GPIO RD

	- Project Working Directory
		Directory				  ower
		-------------------------------		----------
		/projects/p1073001a/techlib/		: p1073001aa
		/projects/p1073001a/design/		: p1073001aa

		/projects/p1073001a/flow/		: p1073001ac0
	
		/projects/p1073001a/user/pm0/		: p1073001aa0
		/projects/p1073001a/user/be0/		: p1073001ab0
		/projects/p1073001a/user/be1/		: p1073001ab1
		/projects/p1073001a/user/fe0/		: p1073001af0
		/projects/p1073001a/user/fe1/
		/projects/p1073001a/user/ip0/		: p1073001ae0
		/projects/p1073001a/user/ip1/
		/projects/p1073001a/user/cad/		: p1073001ac0
		/projects/p1073001a/user/mem/		: p1073001am0
		/projects/p1073001a/user/dft/		: p1073001ad0
 


3) Project Account Management

	1. Separate regualr user account and project account
		regular account - albertli
		project user account - p1072001aa0

		* project design data should be kept in project execution environment under project accounts.

		
	2. Login to regular user account and then rsh/ssh to project account

		* use ~/.rhosts to control which user can login to which project accounts
	
		Example: 
			/projects/p1073001a/users/pm0/.rhosts
			+ brianli
			+ kevinwu

	3. Execute data management & design implementation job from associate project account

		* all unix job actions should be recorded into tracking database
		* machine resource and tool license usage should be recorded  
		
4) Data Management Rule

	1) Only CAD engineer can install the library file into techlib/
	2) Design data can only be checkin to central database pool with formal DVC command 
	3) Design data should be checkout from central pool to local working directory before executing implementation job

