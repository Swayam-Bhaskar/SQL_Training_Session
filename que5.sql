/* Question 5 (Multiple Aggregations)
Generate a warehouse analytics report showing:
- Total number of products
- Average quantity per product
- Total inventory value
- Maximum and minimum stock levels
- Number of distinct categories
Group by warehouse location and only show warehouses with total inventory value > $50,000.

Expected Output:
```
location    | product_count | avg_quantity | total_value | max_stock | min_stock | category_count
------------|--------------|--------------|-------------|-----------|-----------|---------------
Chicago, IL | 8            | 245.5        | 75890.50    | 500       | 125       | 4
Dallas, TX  | 7            | 232.1        | 68720.25    | 450       | 100       | 3
[...]
```*/

SELECT w.location
	,count(p.product_name) AS product_count
	,avg(i.quantity)
	,sum(i.quantity * p.base_price) AS total_value
	,max(i.quantity) AS max_stock
	,min(i.quantity) AS min_stock
	,count(DISTINCT (p.category)) AS category_count
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
INNER JOIN warehouses w ON w.warehouse_id = i.warehouse_id
GROUP BY w.location
HAVING total_value > 50000;

/*Comments
In this question I have to find Total products, Average quantity, Total value, 
Max and min stock levels and number of distinct categories. To do this I have used 
•	SELECT  
    o	Location of the warehouse
    o	count(p.product_name) to count the product name 
    o	avg(i.quantity) to get an average of the quantity
    o	sum(i.quantity * p.base_price) to sum the value of every product
    o	max(i.quantity) to find the product with maximum quantity
    o	min(i.quantity) to find product with minimum quantity
    o	count(DISTINCT (p.category)) to count the different types of categories
•	JOIN to join products table with inventory table and warehouses table and
Giving the results based on 
•	GROUP BY location to show the values based on each warehouse location
•	HAVING total value> 50000 to only show those warehouse with value > 50000



