/* Question 7 (Complex GROUP BY with conditions)
Find product categories where:
- Average inventory value > $10,000
- At least 3 different products in stock
- Maximum quantity of any product > 200
Show category, product count, avg value, and highest stocked product name.

Expected Output:
```
category    | product_count | avg_value | highest_stocked_product
------------|--------------|-----------|----------------------
Electronics | 5            | 12500.75  | Gaming Mouse
Sports      | 4            | 11200.50  | Yoga Mat
[...]
*/

SELECT p.category
	,count(DISTINCT (p.product_id)) AS product_count
	,avg(p.base_price * i.quantity) AS avg_value
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id
WHERE i.quantity > 200
GROUP BY p.category
HAVING avg_value > 10000
	AND product_count >= 3;

/*Comments

In this question i have to find product count, avg value, and highest stocked product for different
categories. So i used 
•  SELECT staement for
   •  product category 
   •  count() to count the distinct products
   •  avg() to get the average of product value 
•  JOIN products with inventory table
•  WHERE to take only whose quantity > 200
•  GROUP BY on product category to bifurcate the data based on product category
•  HAVING clause to apply conditions on aggregated columns