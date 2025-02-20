/* Question 11 (COALESCE, NULLIF, LPAD/RPAD)
Create a report showing formatted product details with:
- Product code (LPAD with zeros to 5 digits)
- Product name (RPAD with dots to 30 characters)
- Current stock (COALESCE with 'Out of Stock')
- Stock status (NULLIF comparison with minimum threshold)
For all products in Electronics category.

Expected Output:
```
product_code | formatted_name                | stock_level | status
-------------|------------------------------|-------------|--------
00001        | Wireless Earbuds............| 150         | NORMAL
00002        | Gaming Mouse................| Out of Stock| LOW
00006        | Smart Watch................. | 175         | NULL
```
*/

WITH TEMP (min_qty)
AS (
	SELECT min(i.quantity)
	FROM products p
	INNER JOIN inventory i ON p.product_id = i.product_id
	WHERE p.category = "Electronics"
	)
SELECT lpad(p.product_id, 5, 0) AS product_code,
	rpad(p.product_name, 30, '.') AS formatted_name,
	coalesce(i.quantity, "Out of Stock") AS stock_level,
	CASE 
		WHEN i.quantity = TEMP.min_qty
			THEN nullif(i.quantity, TEMP.min_qty)
		WHEN i.quantity > TEMP.min_qty AND i.quantity <= 150
			THEN "Low"
		WHEN i.quantity > 150 AND i.quantity <= 200
			THEN "Normal"
		WHEN i.quantity > 200
			THEN "high"
		END AS stock_status
FROM products p
INNER JOIN inventory i ON p.product_id = i.product_id,TEMP
WHERE p.category = "Electronics";


/* Comments
LPAD (used to left pad a string by adding extra characters to the left upto a ceratin length)

RPAD (used to right pad a string by adding extra characters to the right upto a ceratin length)

COALESCE (used to return the first non-null value in a list. It is used to handle null values. 
if all values are null then it will return null.)

NULLIF (used to returns NULL if two expressions are equal,otherwise it returns the first expression.)

In this question i have to return prodcut code,name using lpad and rpad respectively and 
find stock level and status.so i have used
•  WITH clause to create a CTE where i am fetching the minimum product quantity of electronics category
•  SELECT statement with 
    •  "lpad(p.product_id, 5, 0)" which will left pad 5 characters for product id with the character 0
    •  "rpad(p.product_name, 30, '.')" which will right pad 30 characters for product name with the character '.'
    •  "coalesce(i.quantity, "Out of Stock")" to return value as out of stock in case the quantity is null
    •  "nullif(i.quantity, TEMP.min_qty)" to retuen null if both value are equal
    •  CASE WHEN to assign stock status based on different quantity levels
•  FROM products table JOIN with inventory table and the TEMP CTE
•  WHERE clause i have specified the category as electronics to filter the data for electronics 
