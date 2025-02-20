/* Question 4 (CROSS JOIN)
Generate a report showing all possible product-warehouse combinations for 'Sports' category products 
and 'Large' type warehouses to help with expansion planning. Show product name, warehouse location, 
and warehouse capacity.

Expected Output:
```
product_name  | location    | capacity
-------------|-------------|----------
Yoga Mat     | Dallas, TX  | 15000
Yoga Mat     | Chicago, IL | 20000
Yoga Mat     | Houston, TX | 16000
Running Shoes| Dallas, TX  | 15000
[...all combinations...]
```*/

SELECT p.product_name
	,w.location
	,w.capacity
FROM products p
CROSS JOIN warehouses w
WHERE p.category = "Sports"
	AND w.warehouse_type = "Large"
ORDER BY p.product_name DESC;

/* comments
In this que I have to show  all possible product name, warehouse location, and warehouse capacity 
combinations for 'Sports' category products and 'Large' type warehouses.
So here I used 
•	SELECT to show the product name and warehouse details
•	CROSS JOIN products table with warehouse table to return their cartesian product so that 
    all the possible combinations could display
•	WHERE clause I have specified that I need to show for sports category and large type warehouse
•	ORDER by product name in descending order. 

