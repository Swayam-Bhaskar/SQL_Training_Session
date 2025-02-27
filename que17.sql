/*## Question 17 (FIRST_VALUE, LAST_VALUE, NTILE)
Analyze product performance by:
- First and last products sold in each category
- Product price quartiles within category
- Comparison with category boundaries

Expected Output:
```
category    | product_name | price | first_sold | last_sold | quartile | price_range
------------|-------------|-------|------------|-----------|----------|-------------
Electronics | Smart Watch | 199.99| Earbuds    | Keyboard  | 4        | High
Sports      | Yoga Mat    | 29.99 | Shoes      | Weights   | 2        | Medium-Low
```
*/

WITH price_quartiles
AS (
	SELECT p.product_id
		,p.category
		,p.product_name
		,p.base_price
		,ntile(4) OVER (PARTITION BY p.category ORDER BY p.base_price) AS quartile
	FROM products p
	)
	,first_last_sold
AS (
	SELECT p.product_id
		,p.category
		,p.product_name
		,i.sold
		,first_value(p.product_name) OVER (PARTITION BY p.category ORDER BY i.sold) AS first_sold
		,last_value(p.product_name) OVER (PARTITION BY p.category ORDER BY i.sold RANGE BETWEEN 
		UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sold
	FROM products p
	INNER JOIN inventory i using (product_id)
	)
SELECT ps.category
	,ps.product_name
	,pq.base_price
	,ps.first_sold
	,ps.last_sold
	,pq.quartile
	,CASE 
		WHEN pq.quartile = 1
			THEN 'Low'
		WHEN pq.quartile = 2
			THEN 'Medium Low'
		WHEN pq.quartile = 3
			THEN 'Medium High'
		WHEN pq.quartile = 4
			THEN 'High'
		END AS price_range
FROM price_quartiles pq
INNER JOIN first_last_sold ps ON pq.product_id = ps.product_id
WHERE month(ps.sold) = '2'
ORDER BY ps.category
	,pq.quartile;

/* Comments 
In this question I have to show product performance by First and last products sold.
For this i am using CTE 
--price_quartiles-- where i am calculating quartile (i.e dividing the value
in 4 data values) by using NTILE() function with ntile(4) over category order by price dividing the 
prices of product into different quartile for different category.
--first_last_sold--where i am calculating the first and last product sold using the 
first_value() function over product selling date to calculate the first sold and 
lsat_value() function over product selling date to calculate the last sold
for all rows before current row are considered (RANGE BETWEEN UNBOUNDED PRECEDING)
all rows after the current row are considered (UNBOUNDED FOLLOWING)
Then using the SELECT command i am querying the category product_name, price, first_sold, last_sold, 
quartile, price_range where in price range i am using CASE to give the values as per diferent 
quartile vlaues. Then I am using JOIN on both the CTE. Since i am showing the value month wise 
in WHERE clause i am using month() function on sold and giving the result in 
ORDER BY category. 