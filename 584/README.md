# 584. Find Customer Referee

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/find-customer-referee/

## Problem Description

Find the names of the customers that are **not referred by** the customer with `id = 2`.

Return the result table in **any order**.

## Table Schema

**Table: Customer**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| referee_id  | int     |

`id` is the primary key for this table. Each row contains the id and name of a customer, and the id of the customer who referred them (or `NULL` if not referred by anyone).

## Example

**Input:**

Customer table:
| id | name | referee_id |
|----|------|------------|
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |

**Output:**
| name |
|------|
| Will |
| Jane |
| Bill |
| Zack |

## Solution

The `WHERE` clause filters out customers referred by customer `id = 2`, while also keeping rows where `referee_id` is `NULL` (since `NULL != 2` is unknown in SQL, not true).

```sql
SELECT name 
FROM Customer 
WHERE referee_id != 2
OR referee_id IS NULL;
```
