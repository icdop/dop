## Project Account Naming Rule

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

 
## Project User Account Usage Model

	1. Separate regular user account and project user account
		regular user account - albertli
		project user account - n13301ua0

		* project design data should be kept in project execution environment under project accounts.

		* Project user account assignment table:
		
			n13301ua0 : albertli
			n13301ub0 : kevinwu
			n13301ub1 : mattwu
			n13301uc0 : susanho
			n13301ud0 : yorkwu
	
	2. Login to regular user account and then rsh/ssh to project account

		* use $HOME/.rhosts to control which user can login to specific project account
	
		Example: 
			/projects/N13301A/users/n13301ua0/.rhosts
			+ albertli

	3. Execute data management & design implementation job from associate project user account

		* all unix job actions should be recorded into tracking database
		* machine resource and tool license usage should be recorded  
		
