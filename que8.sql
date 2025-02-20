/* Question 8 (UNION and UNION ALL)
Create a report showing:
1. Products with zero inventory (from LEFT JOIN)
2. Products with over 400 units in any warehouse
3. Products with value over $10,000 in any warehouse
Label each row with its source category.

Expected Output:
```
source_category | product_name    | quantity | value
----------------|----------------|----------|-------
No Stock        | Smart Watch    | 0        | 0.00
High Stock      | Backpack       | 450      | 22495.50
High Value      | Gaming Mouse   | 350      | 20996.50
[...]
```
*/

SELECT CASE 
		WHEN i.quantity = 0
			THEN "No Stock"
		END AS source_category
	,p.product_name
	,i.quantity
	,(p.base_price * i.quantity) AS value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.quantity = 0

UNION

SELECT CASE 
		WHEN i.quantity > 400
			THEN "High Stock"
		END AS source_category
	,p.product_name
	,i.quantity
	,(p.base_price * i.quantity) AS value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.quantity > 400

UNION

SELECT CASE 
		WHEN (p.base_price * i.quantity) > 10000
			THEN "High Value"
		END AS source_category
	,p.product_name
	,i.quantity
	,(p.base_price * i.quantity) AS value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
HAVING value > 10000;

/* Comments 
In this question I have to show products with differnt condition based
on source category. TO do this i have used
UNION (This command combines two or more SELECT statements and 
removes duplicates from the final result set).
1. For Products with zero inventory
•  SELECT product name and quantity
•  CASE WHEN there is no quantity(i.e 0) for a product show "NO STOCK"
•  JOIN product table with inventory table and
•  WHERE quantity =0.
UNION
2. For Products with zero inventory
•  SELECT product name and quantity
•  CASE WHEN quantity >400 for a product show "HIGH STOCK"
•  JOIN product table with inventory table and
•  WHERE quantity >400
UNION
3. For Products with zero inventory
•  SELECT product name and quantity
•  CASE WHEN value >10000 for a product show "HIGH VALUE"
•  JOIN product table with inventory table and
•  HAVING quantity >10000 because appling condition on an aggregated colum