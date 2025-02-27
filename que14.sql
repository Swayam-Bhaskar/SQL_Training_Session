/*## Question 14 (Single-Row and Multi-Row Subqueries)
Find products that meet ALL these conditions:
- Price higher than average category price (single-row subquery)
- Stocked in warehouses with >2% capacity utilization (multi-row subquery)
- Total inventory value higher than any Sports category product (multi-row subquery)

Expected Output:
```
product_name    | category    | price  | total_value | warehouses
----------------|------------|--------|-------------|------------
Gaming Mouse    | Electronics| 199.99 | 45000.50   | Seattle, Dallas
Smart Watch     | Electronics| 159.99 | 42500.75   | Chicago, Boston
*/

SELECT p.category
	,p.product_name
	,p.base_price AS price
	,(p.base_price * i.quantity) AS total_value
	,w.location AS warehouse
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
INNER JOIN warehouses w ON w.warehouse_id = i.warehouse_id
WHERE base_price > (
		SELECT avg(base_price)
		FROM products
		)
	AND (p.base_price * i.quantity) > ALL (
		SELECT (p.base_price * i.quantity)
		FROM products p
		INNER JOIN inventory i using (product_id)
		WHERE p.category = "Sports"
		)
	AND w.location IN (
		SELECT w.location
		FROM warehouses w
		INNER JOIN inventory i using (warehouse_id)
		WHERE i.quantity > (0.02 * w.capacity)
		);

/* Comments 
In this question I have to show product_name, category, price, total_value, warehouses
So i am using SELECT to query them and joining the products, inventory, warehouse table 
with INNER JOIN. And for satisfying the query result for different condition i am using subquery
in WHERE clause which are:
For --Price higher than average category price--
	I am selecting average of base price using avg() function
	
For --Total inventory value higher than any Sports category product
	I am taking value(i.e base_price * quantity) grater than all values from subquey that is fetching
	all the value of product that lies under sports category. So this subquery will return values for
	products whose value are greatet than all the values of sports category.
For --Stocked in warehouses with >2% capacity utilization
	I am using subquery where i am fetching all the warehouse location where quantity of product
	greater than 2% of capacity (i.e 0.02*capacity)