/* 
Write a query to find all employees who joined after their manager.
*/

CREATE TABLE Employees_linkedin2 (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(255),
hire_date DATE,
manager_id INT 
);

INSERT INTO Employees_linkedin2 (employee_id, employee_name, hire_date, manager_id) VALUES
(1, 'John Doe', '2023-01-15', NULL), 
(2, 'Jane Smith', '2023-02-20', 1),
(3, 'David Lee', '2023-03-10', 1),
(4, 'Sarah Jones', '2022-01-05', 2);

SELECT e.employee_name
FROM Employees_linkedin2 e
INNER JOIN Employees_linkedin2 e2 ON e.manager_id = e2.employee_id
WHERE e.hire_date > e2.hire_date;

/* Comments 
In this question I have to find all employees who joined after their manager. So here i am using 
SELF JOIN on Employees_linkedin2 on the condition where manager id of left table = employee id of 
right table as the manager is also an employee. 
And hire date of those emplyee > hire date of manager so i am using WHERE clause to specify that.