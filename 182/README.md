# 182. Duplicate Emails

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/duplicate-emails/

## Problem Description

Write a solution to report all the duplicate emails from the `Person` table.

Return the result table in **any order**.

## Table Schema

**Table: Person**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| email       | varchar |

`id` is the primary key for this table.

## Example

**Input:**

Person table:
| id | email   |
|----|---------|
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

**Output:**
| Email   |
|---------|
| a@b.com |

## Solution

Group rows by `email` and use `HAVING COUNT(*) > 1` to keep only emails that appear more than once.

```sql
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
```
