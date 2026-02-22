# 176. Second Highest Salary

**Difficulty:** Medium  
**Topic:** Database  
**Link:** https://leetcode.com/problems/second-highest-salary/

## Problem Description

Write a solution to find the second highest **distinct** salary from the `Employee` table. If there is no second highest salary, return `null`.

Return the result table in **any order**.

## Table Schema

**Table: Employee**

| Column Name | Type |
|-------------|------|
| id          | int  |
| salary      | int  |

`id` is the primary key for this table.

## Example

**Input:**

Employee table:
| id | salary |
|----|--------|
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |

**Output:**
| SecondHighestSalary |
|---------------------|
| 200                 |

**Input (no second highest):**

Employee table:
| id | salary |
|----|--------|
| 1  | 100    |

**Output:**
| SecondHighestSalary |
|---------------------|
| null                |

## Solution

A subquery selects distinct salaries ordered descending and skips the first row with `OFFSET 1`, returning the next one. Wrapping it in an outer `SELECT` with the alias ensures `null` is returned when no second salary exists and the column is correctly named.

```sql
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1
    LIMIT 1
) AS SecondHighestSalary;
```
