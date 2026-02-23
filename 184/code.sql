SELECT d.name AS Department, e.name AS Employee, Salary 
FROM Employee AS e 
INNER JOIN Department AS d 
ON d.id = e.departmentId
WHERE (departmentId, salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);
