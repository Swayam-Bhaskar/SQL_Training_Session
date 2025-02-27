/*write a Recursive query. Create a new column, that shows how many managers were there above him. from 
que 19
For eg:
for employee_id 4: he has 2 managers above him (employee_id: 2 and 1)
for employee_id: 2 and 3, has only 1 manager (employee_id: 1)
for employee_id:1, he is the manager (He reports to no one as his manager_id is null)
*/
WITH RECURSIVE ManagerHierarchy
AS (
	SELECT employee_id
		,employee_name
		,manager_id
		,0 AS manager_count
	FROM Employees_linkedin2
	WHERE manager_id IS NULL
	
	UNION ALL
	
	SELECT e.employee_id
		,e.employee_name
		,e.manager_id
		,mh.manager_count + 1
	FROM Employees_linkedin2 e
	INNER JOIN ManagerHierarchy mh ON e.manager_id = mh.employee_id
	)
SELECT employee_id
	,employee_name
	,manager_count
FROM ManagerHierarchy;

/* Comments 
In this question I have to show how many managers were there above each employee.
For this I am using a recursive CTE. A recursive common table expression is one 
having a subquery that refers to its own name. The recursive CTE subquery has two parts, 
separated by UNION ALL or UNION.
So here i am creting a recursive cte where the first part before union (i.e is a nonrecursive part)
will give the initial row. Here i am fetching the manager deatil and settig manager count before
him as 0.
Then in recursive part i am adding the employee details with manager count + 1 and using 
JOIN on second table with first table on manager id and employee id
After that i am fetching the manager count with emplyee details in the SELECT statement.