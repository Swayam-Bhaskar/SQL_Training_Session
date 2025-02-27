/*## Question 10 (Stored Procedure)
Create a stored procedure called `transfer_inventory` that:
- Takes source_warehouse_id, target_warehouse_id, product_id, and quantity as parameters
- Transfers specified quantity from source to target warehouse
- Includes error handling for insufficient stock
- Logs the transfer in a new audit_log table
- Returns success/failure message

Test the procedure with:
- Success case: Transfer 50 units of product_id 1 from warehouse 1 to warehouse 2
- Failure case: Try to transfer 1000 units (more than available)*/

CREATE TABLE audit_log (
	log_id INT PRIMARY KEY auto_increment
	,source_warehouse_id INT
	,target_warehouse_id INT
	,product_id INT
	,transfer_quantity INT
	,transfer_date DATETIME
	,STATUS VARCHAR(200)
	);

delimiter //

CREATE PROCEDURE transfer_inventory (
	IN source_warehouse_id INT
	,IN target_warehouse_id INT
	,IN product_id INT
	,IN quantity INT
	)
lv:
BEGIN
	DECLARE src_qty INT;
	DECLARE tgt_qty INT;

	SELECT inventory.quantity
	INTO src_qty
	FROM sys.inventory
	WHERE inventory.warehouse_id = source_warehouse_id
		AND inventory.product_id = product_id limit 1;

	IF src_qty IS NULL
		OR src_qty < quantity then
		INSERT INTO audit_log (
			source_warehouse_id
			,target_warehouse_id
			,product_id
			,transfer_quantity
			,transfer_date
			,STATUS
			)
		VALUES (
			source_warehouse_id
			,target_warehouse_id
			,product_id
			,quantity
			,now()
			,'Failed:Insufficeint stock'
			);

	leave lv;
END
IF ;
	UPDATE sys.inventory
	SET inventory.quantity = inventory.quantity - quantity
	WHERE inventory.warehouse_id = source_warehouse_id
		AND inventory.product_id = product_id;

SELECT inventory.quantity
INTO tgt_qty
FROM sys.inventory
WHERE inventory.warehouse_id = target_warehouse_id
	AND inventory.product_id = product_id limit 1;

IF tgt_qty IS NULL then
	INSERT INTO sys.inventory (
		product_id
		,warehouse_id
		,quantity
		,last_updated
		)
	VALUES (
		product_id
		,target_warehouse_id
		,quantity
		,now()
		);
ELSE
	UPDATE sys.inventory
	SET inventory.quantity = inventory.quantity + quantity
	WHERE inventory.warehouse_id = target_warehouse_id
		AND inventory.product_id = product_id;
	END

IF ;
	INSERT INTO audit_log (
		source_warehouse_id
		,target_warehouse_id
		,product_id
		,transfer_quantity
		,transfer_date
		,STATUS
		)
	VALUES (
		target_warehouse_id
		,target_warehouse_id
		,product_id
		,quantity
		,now()
		,'Success'
		);
	END //

delimiter;

call transfer_inventory(1, 1, 2, 10);

SELECT *
FROM audit_log;

/* Comments 
In this question I have to Create a stored procedure called `transfer_inventory` that:
- Takes source_warehouse_id, target_warehouse_id, product_id, and quantity as parameters
and then return values based on that.
Here first i have created an AUDIT-LOG table to keep track of the logs.
Then i creted a stored procedure using CREATE PROCEDURE and eneterd the paramenets required
with IN command. I have specified a label "lv" which will be used later in case to exit the procedure 
in middle. with BEGIN i am strting the procedure. 
First  I am using DECLARE to declare two int type variables src_qty, tgt_qty
This is to check the parameters value in case of error handling putting the inventory value of parameterized
source warehouse in src_qty from inventory table to check if the value is null or the value is less
than the required transfer quantity. If the conditions are not met the values are inserted into 
AUDIT_LOG table. 
After that i am exiting the procedure by LEAVE command.

If condition is met then the values will be updated from inventory table using 
UPDATE where i am setting the inventory quantity -quantity
Then I am inserting the inventory value in the tgt_qty from inventory table from target warehouse
given in parameters. If the product doesnot exist in the target warehouse (i.e tgt_qty IS NULL)
then i am inserting the new value in the inventory table. if product exist i am using
UPDATE where i am setting the inventory quantity +quantity.
And I am inserting the log in AUDIT_LOG table