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
	product_id INT PRIMARY KEY
	,warehouse_id INT
	,new_quantity INT
	);

INSERT INTO inventory_updates
SELECT product_id
	,warehouse_id
	,quantity
FROM inventory;

INSERT INTO inventory_updates (
	product_id
	,warehouse_id
	,new_quantity
	)
VALUES 
    (1,1,200),
    (21,1,100) AS a ON duplicate KEY

UPDATE new_quantity = a.new_quantity;

SELECT * FROM inventory_updates;

/* COMMENTS
In this question i have to first create a new table called INVENTORY_UPDATES and then 
on the inventory table I have inserted the values inside the table using the 
•  INSERT INTO and i am fetching the data from the old inventory table.

Then I have to merge the new values with the old values and if in case of any duplicates i
will have to update the value so i used

•  INSERT INTO and gave the new values and i used 
•  ON duplicate KEY this is to handle those value which have a matching record with old table and
•  UPDATE the old value with new value