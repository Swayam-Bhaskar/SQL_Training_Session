/*Question 15 (RANK, DENSE_RANK, ROW_NUMBER)
Create a warehouse performance report showing:
- Regular ranking by total inventory value
- Dense ranking by number of products
- Row number by average quantity
Include only warehouses handling >5 products.

Expected Output:
```
warehouse    | total_value | value_rank | products | product_rank | avg_qty | qty_rn
-------------|-------------|------------|----------|--------------|---------|--------
Chicago      | 120500.75  | 1          | 12       | 1            | 245     | 3
Dallas       | 120500.75  | 1          | 10       | 2            | 300     | 1
Seattle      | 98750.50   | 3          | 10       | 2            | 280     | 2
```*/

SELECT w.location
	,sum(p.base_price * i.quantity) AS total_value
	,rank() OVER ( ORDER BY sum(p.base_price * i.quantity) DESC) AS value_rank
	,count(p.product_id) AS product_count
	,dense_rank() OVER (ORDER BY count(product_id) DESC) AS product_rank
	,avg(i.quantity) AS avg_qty
	,row_number() OVER (ORDER BY avg(i.quantity) DESC) AS qty_rn
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
INNER JOIN warehouses w ON w.warehouse_id = i.warehouse_id
GROUP BY w.location
ORDER BY value_rank
	,product_rank;

/* Comments 
In this question I have to show warehouse performance with ranking based on differnt scenario
for that i am querying the result in SELECT statement the warehouse location then 
sum of base_price*quantity as total value
For --Regular ranking by total inventory value--
	I am using RANK() function over total_value 
For --Dense ranking by number of products
	I am using DENSE_RANK() OVER  the count of quantity 
For -- Row number by average quantity
	I am using the ROW_NUMBER() function over the average of quantity
then i am joining the warehouse product and inventory table and using 
ORDER in value rank and product rank 