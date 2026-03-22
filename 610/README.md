# 610. Triangle Judgement

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/triangle-judgement/

## Problem Description

Report for every three line segments whether they can form a triangle.

Return the result table in **any order**.

## Table Schema

**Table: Triangle**

| Column Name | Type |
|-------------|------|
| x           | int  |
| y           | int  |
| z           | int  |

`(x, y, z)` is the primary key for this table. Each row of this table contains the lengths of three line segments.

## Example

**Input:**

Triangle table:
| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

**Output:**
| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |

## Solution

Apply the triangle inequality theorem: three sides form a triangle if and only if the sum of any two sides is greater than the third side.

```sql
SELECT x, y, z, CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle;
```
