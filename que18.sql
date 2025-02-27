/*Question 18 (Role-Based Access Control)
Create a permission structure for an inventory management system with these roles:
- Inventory Manager: Full access to all tables
- Stock Clerk: Can view all tables, update inventory quantities
- Analyst: Can only view (SELECT) all tables
- Auditor: Can only view inventory and audit_log tables

Expected Output after running GRANT commands:
```
Role              | Select | Insert | Update | Delete | References | Trigger
------------------|---------|---------|---------|---------|------------|----------
inventory_manager | Yes    | Yes    | Yes    | Yes    | Yes       | Yes
stock_clerk      | Yes    | No     | Partial| No     | No        | No
analyst          | Yes    | No     | No     | No     | No        | No
auditor          | Partial| No     | No     | No     | No        | No
```
*/
CREATE user Inventory_Manager;

GRANT ALL ON mydb.*
	TO 'Inventory_Manager' @ '%';

CREATE user Stock_Clerk;

GRANT SELECT ON mydb.*
	TO 'Stock_Clerk' @ '%';

GRANT UPDATE (quantity) ON mydb.inventory
	TO 'Stock_Clerk' @ '%';

CREATE user Analyst;

GRANT SELECT ON mydb.*
	TO 'Analyst' @ '%';

CREATE user Auditor;

GRANT SELECT ON mydb.inventory
	TO 'Auditor' @ '%';

GRANT SELECT ON mydb.audit_log
	TO 'Auditor' @ '%';

/* Comments 
In this question I have to create a permission structure for different users based on their role. So for
-- Inventory Manager: Full access to all tables--
I am creating the user using CREATE user command then i am using GRANT command to give any permission 
to the user. with GRANT ALL i am giving all the privilages on database.* (i.e on all the tables in the database)
--Stock Clerk: Can view all tables, update inventory quantities
with CREATE user and then GRANT SELECT (to view) and GRANT UPDATE (to edit)
--Analyst: Can only view
GRANT SELECT for viewing with the database.* to view on all tables
--Auditor: Can only view inventory and audit_log tables
for granting partial access (i.e only view one table of a database) GRANT select on database.tablename 