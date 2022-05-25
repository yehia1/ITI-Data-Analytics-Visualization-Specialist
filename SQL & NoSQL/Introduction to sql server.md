# Introduction to sql server
## Understanding core database concepts
### What is database 
database is organized collection of data, typically stored and accessed electronically from computer system or electronic device.

---
### Types of Databases and relations
#### Types of Databases
- **Heriarchical**: Directory structure
- **Flat file**: csv or excel 
- **Relational**: mysql,sqlserver and oracle 

#### Relations 
- **Tables**: like an excel sheet
- **Column**: column in excel sheets
- **Raw**: Raw like excel sheets
---
### Data manipulation language(DML)
|Statment| Description|
|:-|:-|
|Select|Return rows from database and enables selection of one or many rows or columns from one or many table|
|Insert|Add rows to tables and views|
|Update|Change existing data in  tables and views|
|Delete| Remove one or more rows fromtables and views|
|Merge|Perform a insert,update or delete on a target table based on the results of a join with source table|
|Bulk insert|Import data file into database or view|
### Data definition language (DDL)
|Statment| Description|
|:-|:-|
|Create|Enables creating a item in SQL server for example database,table,users,views and indexes etc|
|Alter|Modifying existing objects for example database,table,users,views and indexes|
|Drop|Drop existing object|
|collations|Define the collations of database or table columns, or a collation cast operation when applied to character string expression|

---
## Create database object 
### What are data types
An attribute that specifies the type of data an object can hold, 
such as data and time, binary,strings,monetary data and integer.

### Tables and Views 
**Table**
- contains all the data in database in row-column format
- can have 1024 columns, 30000 if using sparse(sparse: optimized storage of null values).
- Assign properties to table and column and use compression

**View**:
- Virtual table defined by query 
- similar to table with named columns and rows that are produced dynamically when referenced
- Acts like filter on the tables and can reference multiple tables and provide level of security
--- 
### Procedures
- Group of one or more Transact-SQL statments or a reference to a Mircsoft .NET framework CLR method
- Can accept input parameters and return multiple values as output parameters
-  Having programming statments that perform operation with in the database
-  Return a status value indicating success or failure

**Benefits from procedures:**
- Reduce server/client network traffic 
- Stronger security 
- Reuse of code
- Easier maintenance
- Improved performance
---
### Functions
routines that accept parameters, perform an action, and return the result of that action as a value

**Benefits**
- Allow modular programming
- Allow for faster excution 
- Reduce network traffic S
- Scaler function 
- Table-valued function 
- built in system functions
- --
---
## Understanding data storage
### Normalization
Resolving issues of data redundancy and improving storage efficiency, data intergrity, scalabiliy.

Helps reduce insert,updat and delete anomalies
* * *
### Primary, foreign ,composite key
#### Primary:
- Uniquely identifies each record in a table
- Cannot contail NULL values, must be UNIQUE
- Only 1 primary key per table using single or multiple fields
#### Foreign:
- Can refernce of unique constraints in another table
- Can reference only tables in same database in the same server
- Can reference self columns in same table

#### Composite keys:
A key that includes multiple columns. can designated as the primary key if the combination if the columns result in a unique composite value for every row u the table commonly used in tables designed with many to many relationships
***
---
## administer a database 
### Authentication
|Statment|Description|
|:-|:-|
|Windos logins|Provides single sign-on for the OS AND sql server,windows group,domain user account,local user account|
|SQL logins|Allows application-specofc security and mixes OS access SQL server loging -server role -database user -role ,application role or group|
### Users
- **Sysadmin:** superuser role-SA is mapped to sysadmin-SA must be secured.
- **Windows logins**
- **SQL logins**
- **Windows groups**
- **User without signing**
- ---
### Database permissions
- **Grant:** gives permission to do something
- **Deny:** Blocks access
- **Revoke:** removes grant or deny from user
---
### Objects and permissions 
- **Instance-level Endpoints:** way to access database and way to connect to the network using requests
- **Database- level assembly and reference:** contains class meta data in managed code
- **Shcema-level tables,views,etc**
- **Column levels**
---
### Database roles 
|Statment|Description|
|:-|:-|
|db_owner|perform all the configuration and maintenacne including dropping the database|
|db_securityadmin|modify role membership and manage permissions|
|db_accessadmin|add or remove access to the database for windos logins or groups, and SQL server logins|
|db_backupoperator|can backup the database|
|db_ddladmin|can run any DDL comand in database|
|db_datawriter|can add, delete,change the data in all user tables|
|db_datareader|can read all data from all users|
|db_denydatawriter|cannot add ,modify,or delete any data in the user tables withina database|
|db_denydatareader|cannot read any data in the user tables within a database|
### Maintainance
#### statistics:
- used by query optimizer to compile and optima excution plan
- out of date statistics can negatively impact the query optimizer's plan choice
- auto update statistics updates after 20% + 500 rows changes
- you need to a process to programmaticaly updata statistics to not rely on automatic updates

#### Indexs
- Fragmentation naturally occurs due to inserts , updates and deletes
- Fragmentation can negatively impact performance 
- Controlling Fragmentations :
1. Rebuild,or disable and rebuild the index
2. Database maintainance plus
3. Custom script in SQL agent job
4. Third party tools

#### Consistency check
- Corruption happens duo to I/O sustem issues
- Finding corruptions : DBCC CHECKDB
- you have to schedule a job to run DBCC CHECKDB often enough to prevent potential data loss
---
### Backups and disaster recovery

#### Backups
 - Full
 - Diffrential: catch the updated changes since last full backup
 - Log *
 - Filegroups: for specific files to be backed  
 - File : backup each file independatly 
 - Copy-only

