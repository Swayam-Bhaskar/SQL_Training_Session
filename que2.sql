/* Question 2 (INNER JOIN)
List all warehouses that store electronics products, along with the total quantity 
and total value of electronics inventory (quantity * base_price). 
Only include warehouses with electronics inventory worth over $20,000. 
Order by total value descending.

Expected Output:
```
location    | total_quantity | total_value
------------|---------------|-------------
Seattle, WA | 350           | 31497.50
Boston, MA  | 365           | 25696.35
Chicago, IL | 275           | 21997.25
*/

SELECT w.location
	,sum(i.quantity) AS total_quantity
	,sum(i.quantity * p.base_price) AS total_value
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
INNER JOIN warehouses w ON w.warehouse_id = i.warehouse_id
WHERE p.category = "Electronics"
GROUP BY location
HAVING total_value > 20000
ORDER BY total_value DESC;

/* comments

In this question I have  to find  warehouses that store electronics products, their total quantity 
and value . So I queried with
•	SELECT statement for
    o	warehouse location 
    o	the sum of quantity to find total number of products in each warehouse
    o	"sum(i.quantity * p.base_price)" to calcule the total value for all the products combined
         in the warehouse. 
•	JOIN I have use inner join of products table with inventory and warehouse table and 
•	GROUP BY location of the warehouse. Since I am using aggregate functions here i am using
•	HAVING clause to segregate the queryed values based on total value > 20000 
and then returning the whole query with there total value in descending order using 
o	ORDER BY total value



