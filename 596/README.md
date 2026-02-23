# 596. Classes More Than 5 Students

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/classes-more-than-5-students/

## Problem Description

Write a solution to find all the classes that have **at least five students**.

Return the result table in **any order**.

## Table Schema

**Table: Courses**

| Column Name | Type    |
|-------------|---------|
| student     | varchar |
| class       | varchar |

`(student, class)` is the primary key for this table. Each row indicates the name of a student and the class in which they are enrolled.

## Example

**Input:**

Courses table:
| student | class    |
|---------|----------|
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |

**Output:**
| class |
|-------|
| Math  |

## Solution

Group by class and use `HAVING` to filter groups with at least 5 students.

```sql
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;
```
