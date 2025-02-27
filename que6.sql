/* Question 6 (MERGE/UPSERT)
Using this temporary table structure and data:
```sql
CREATE TEMP TABLE inventory_updates (
    product_id INT,
    warehouse_id INT,
    new_quantity INT
);
INSERT INTO inventory_updates VALUES
(1, 1, 200),  -- Update existing
(21, 1, 100); -- Insert new
```
Write a MERGE (UPSERT) query to update inventory quantities, inserting new records if they don't exist.
*/

CREATE TABLE inventory_updates (
	product_id INT
	,warehouse_id INT
	,new_quantity INT
	);

INSERT INTO inventory_updates (
	product_id
	,warehouse_id
	,new_quantity
	)
VALUES 
	(1,1,200),
	(21,1,100);

UPDATE inventory i
INNER JOIN inventory_updates iu ON i.product_id = iu.product_id

SET i.quantity = iu.new_quantity;

INSERT INTO products value (21, 'Clothes', 'Fashion', 12.99, 0.2);

INSERT INTO inventory (
	product_id
	,warehouse_id
	,quantity
	)
SELECT iu.product_id
	,iu.warehouse_id
	,iu.new_quantity
FROM inventory_updates iu
LEFT JOIN inventory i ON i.product_id = iu.product_id
WHERE i.product_id IS NULL;

SELECT * FROM inventory;

/* COMMENTS
In this question i have to first create a new table called INVENTORY_UPDATES and then 
on the inventory table I have inserted the values inside the table using the 
•  INSERT INTO 

Then I have to merge the new values with the old values and if in case of any duplicates i
will have to update the value so i used type1 SCD logic where

•  UPDATE the table inventory if there is a match of product_id with inventory update table.
If there is no match i.e any new product id is there in inventory updates then we need to add 
a product corresponding to the product id given in inventory update. then using
•  INSERT INTO inventory and gave the new values if no values matched