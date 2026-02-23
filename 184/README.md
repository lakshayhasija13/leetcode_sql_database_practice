# 184. Department Highest Salary

**Difficulty:** Hard  
**Topic:** Database  
**Link:** https://leetcode.com/problems/department-highest-salary/

## Problem Description

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in **any order**.

## Table Schema

**Table: Employee**

| Column Name  | Type    |
|--------------|---------|
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |

`id` is the primary key for this table. `departmentId` is a foreign key referencing `Department.id`.

**Table: Department**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key for this table.

## Example

**Input:**

Employee table:
| id | name  | salary | departmentId |
|----|-------|--------|--------------|
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |

Department table:
| id | name  |
|----|-------|
| 1  | IT    |
| 2  | Sales |

**Output:**
| Department | Employee | Salary |
|------------|----------|--------|
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |

## Solution

Join `Employee` with `Department` and filter rows where `(departmentId, salary)` matches the maximum salary per department using a subquery.

```sql
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary 
FROM Employee AS e 
INNER JOIN Department AS d 
ON d.id = e.departmentId
WHERE (departmentId, salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);
```
