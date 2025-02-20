/* Question 1 (LEFT JOIN)
Find all products and their current inventory levels in Seattle warehouse (warehouse_id = 1), 
including products with no inventory. Display product name, category, and quantity. 
Order by quantity descending, with NULLs last.

Expected Output:
```
product_name        | category    | quantity
-------------------|-------------|----------
Gaming Mouse       | Electronics | 200
Wireless Earbuds   | Electronics | 150
Tennis Racket      | Sports      | NULL
Smart Watch        | Electronics | NULL
[...remaining products with NULL quantities...]
*/

SELECT p.product_name
	,p.category
	,CASE 
		WHEN i.warehouse_id = 1
			THEN i.quantity
		ELSE NULL
		END AS quantity
FROM products p
LEFT JOIN inventory i ON p.product_id = i.product_id
ORDER BY quantity DESC;

/*Comments :
In this query i have to find all the 
•	product name 
•	category along with their quantity
for warehouse id 1 but the output should return all the products names and category 
irrespective of they are in warehouse 1 or not. The corresponding quantity should 
be returned as "null" for those products which are not in warehouse 1.

To achive this i used the 
•	SELECT product name and category from products table to show them in result and i used 
•	LEFT JOIN on products table with inventory table so that all the records of product table 
    (i.e product name and category is returned) and i used a 
•	CASE WHEN statement for warehouse id =1 so that with id 1 it will return the quantity of 
    product and for other product not in warehouse 1 it will return null. 
And i am querying the output based on descending value of product quantity by
•	ORDER BY quantity desc
