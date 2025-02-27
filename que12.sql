/*## Question 12 (Cumulative Sum and Average)
Generate a monthly sales trend analysis showing:
- Running total of inventory value
- Running average of quantity
- Percentage of total inventory
Ordered by warehouse location and product category.

Expected Output:
```
location    | category    | quantity | running_total | running_avg | pct_of_total
------------|------------|----------|---------------|-------------|-------------
Chicago, IL | Electronics| 250      | 12500.00      | 250.00      | 15.5
Chicago, IL | Sports     | 300      | 27500.00      | 275.00      | 28.3
Dallas, TX  | Electronics| 200      | 37500.00      | 250.00      | 35.8
```
*/

WITH qty_sum
AS (SELECT sum(quantity) AS sum_qty
	FROM inventory
	)
SELECT w.location, p.category
	,sum(i.quantity) AS quantity
	,sum(sum(p.base_price * i.quantity)) OVER (ORDER BY w.location) AS running_total
	,(sum(sum(i.quantity)) OVER (ORDER BY w.location)/sum(count(i.quantity)) OVER (ORDER BY w.location)
		) AS run_avrg
	,round((i.quantity / sum_qty) * 100, 2) AS pct_of_total

FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
INNER JOIN warehouses w ON w.warehouse_id = i.warehouse_id
	,qty_sum
WHERE month(i.last_updated) = '2'
GROUP BY w.location
	,p.category
	,pct_of_total
ORDER BY w.location
	,p.category;

/* Comments 
In this question I have to show warehous location, products categories with running total and average.
So to do this I have first created a CTE where i am calculating the sum of all the quantity from inventory 
table. Then in Select statment i am querting
-sum of quantity
-sum of sum(product price*quantity) (i.e product value) over warehouse location so it will fetch me the
 cumlative sum of all the product values by warehouse location.
-sum of sum(quantity) over warehouse location will fetch the cumlative sum for the quantity present in 
 warehouse and dividing it by number of quantity fetched by sum of count quantity will give the running
 average.
-quantity of each product in warehouse divided by sum of all the products quantity *100 will give the 
 percentage of product.
and i am joining the tables product,inventory,warehouse for month of last updated as 2 (for february month)
Group the records based on category, location 
Order the records based on category, location.