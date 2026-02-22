# 196. Delete Duplicate Emails

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/delete-duplicate-emails/

## Problem Description

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest `id`.

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
| id | email            |
|----|------------------|
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |

**Output:**

Person table:
| id | email            |
|----|------------------|
| 1  | john@example.com |
| 2  | bob@example.com  |

## Solution

Use a subquery to find the minimum `id` for each email address. Delete all rows whose `id` is not in that set, effectively removing duplicates while keeping the smallest `id` per email.

> **Note:** This solution is written for **PostgreSQL**. In MySQL, referencing the target table in a subquery within a `DELETE` statement is not allowed; a derived table (nested subquery) would be required instead.

```sql
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);
```
