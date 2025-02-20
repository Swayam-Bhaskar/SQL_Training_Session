/*Question 3 (SEMI JOIN)
Find all suppliers who supply products that have current inventory levels below 100 units in 
any warehouse. Show supplier name, country, and reliability score. 
Order by reliability score descending.

Expected Output:
```
supplier_name      | country     | reliability_score
------------------|-------------|------------------
FitLife Supplies  | USA         | 4.90
TechPro Solutions | USA         | 4.80
SmartHome Devices | South Korea | 4.50
*/

SELECT s.supplier_name
	,s.country
	,s.reliability_score
FROM suppliers s
INNER JOIN inventory i using (supplier_id)
WHERE i.quantity < 100
ORDER BY reliability_score DESC;

/* Comments
In this question I have to query the supplier details (i.e supplier name, country, and reliability score)
who supply products that have current inventory levels below 100 units in any warehouse. 
So I used 
•	SELECT command for supplier name,country and score to query them
•	JOIN command to join the supplier table with inventory table 
•	WHERE clause I have specified quantity < 100 to show for only those suppliers whole qty is 
    more than 100
•	ORDER BY to return the query in descending order based on reliability score
