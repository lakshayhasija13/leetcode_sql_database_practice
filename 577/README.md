# 577. Employee Bonus

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/employee-bonus/

## Problem Description

Write a solution to report the name and bonus amount of each employee with a bonus **less than** 1000.

Return the result table in **any order**.

## Table Schema

**Table: Employee**

| Column Name | Type    |
|-------------|---------|
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |

`empId` is the primary key for this table.

**Table: Bonus**

| Column Name | Type |
|-------------|------|
| empId       | int  |
| bonus       | int  |

`empId` is the primary key for this table.

## Example

**Input:**

Employee table:
| empId | name   | supervisor | salary |
|-------|--------|------------|--------|
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

Bonus table:
| empId | bonus |
|-------|-------|
| 2     | 500   |
| 4     | 2000  |

**Output:**
| name | bonus |
|------|-------|
| Brad | null  |
| John | null  |
| Dan  | 500   |

## Solution

A `LEFT JOIN` is used to include employees who have no bonus entry (resulting in `NULL`), along with those whose bonus is less than 1000.

```sql
SELECT name, bonus 
FROM Employee
LEFT JOIN Bonus 
USING (empId)
WHERE bonus IS NULL OR bonus < 1000;
```
