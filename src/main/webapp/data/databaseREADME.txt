Gold Database version 1.0 11/10/2017

GENERAL USAGE NOTES
---------------------
	
	-	Ensure PostgreSQL and DbVisualizer 9.5.3 or later are installed on local machine.
	-	While installing PostgreSQL set the password to ‘admin’.
	-	Accessing a database with DbVisualizer requires the creation and setup of a database 
		connection. For instructions, consult DbVisualizer 9.5 Users Guide, 
		http://confluence.dbvis.com/display/UG95/Creating+a+Connection+-+basics

		When prompted:
		
		o	Name the connection alias ‘Gold’.
		o	Select PostgreSQL as the JBDC driver from the dropdown menu.
		o	Database Userid is ‘postgres’.
		o	Database Password is ‘admin’.
-------------------------------------------------------------------------------------------------

CREATING TABLES
-------------------------------------------------------------------------------------------------
	-	Execute the script found in the Gold Project build 
		gold\src\main\webapp\data\gold.ddl
	-	Select the run button (green arrow) to create and populate tables.
	-	To ensure table creation, refresh the Connections window (left of screen). Expand 
		the folder entitled Gold. Then, expand the folder entitled public. 
		Finally, expand the Table grid. If successful, you can view the account, account_role, 
		role and workflow tables.
	-	If desired enter test data found in the Gold Project build
		gold\src\main\webapp\data\testData.txt into SQL Commander.
================================================================================================


