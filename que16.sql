/*## Question 16 (Self Join)
Find all pairs of products that:
- Are in the same category
- Have price difference < $20
- Are stocked in same warehouse
List them as potential substitute products.

Expected Output:
```
category    | product1     | price1 | product2     | price2 | warehouse
------------|-------------|---------|--------------|---------|----------
Electronics | Gaming Mouse | 59.99   | Keyboard    | 49.99   | Seattle
Sports      | Yoga Mat    | 29.99   | Water Bottle| 19.99   | Dallas
```
*/

SELECT p1.category
	,p1.product_name
	,p1.base_price
	,p2.product_name
	,p2.base_price
	,w.location
FROM warehouses w
INNER JOIN inventory i1 ON w.warehouse_id = i1.warehouse_id
INNER JOIN products p1 ON i1.product_id = p1.product_id
INNER JOIN inventory i2 ON w.warehouse_id = i2.warehouse_id
INNER JOIN products p2 ON i2.product_id = p2.product_id
WHERE p1.category = p2.category
	AND p1.product_id < p2.product_id
	AND abs(p1.base_price - p2.base_price) <= 20
	AND i1.warehouse_id = i2.warehouse_id
GROUP BY p1.category
	,p1.product_name
	,p1.base_price
	,p2.product_name
	,p2.base_price
	,w.location;

/* Comments 
In this question I have to show product category and pair of products stocked in same warehouse based on
different conditions. For this i am using SELF join on the products and inventory table with warehouse table.
Using SELECT i am querying the product category and product name and price from the self joined table 
where the join condition is based on factros:
For -- Are in the same category
	In the WHERE clause p1.category=p2.category
For -- Have price difference < $20	
	In the WHERE clause abs(p1.base_price - p2.base_price) <= 20 abs value will fetch positive differnce 
	only eliminating any issue arriving by negative difference.
For -- Are stocked in same warehouse
	In the WHERE clause i1.warehouse_id = i2.warehouse_id
and finally  Grouping it by category, product name ,price and location.