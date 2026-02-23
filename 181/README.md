# 181. Employees Earning More Than Their Managers

**Difficulty:** Medium  
**Topic:** Database  
**Link:** https://leetcode.com/problems/employees-earning-more-than-their-managers/

## Problem Description

Write a solution to find the employees who earn more than their managers.

Return the result table in **any order**.

## Table Schema

**Table: Employee**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |

`id` is the primary key for this table. Each row contains information about an employee and their manager's id.

## Example

**Input:**

Employee table:
| id | name  | salary | managerId |
|----|-------|--------|-----------|
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | null      |
| 4  | Max   | 90000  | null      |

**Output:**
| Employee |
|----------|
| Joe      |

## Solution

A self-join on the `Employee` table is used to compare each employee's salary with their manager's salary.

```sql
SELECT e.name AS Employee
FROM Employee AS e
INNER JOIN Employee AS m 
ON e.managerId = m.id
WHERE e.salary > m.salary;
```
