# 183. Customers Who Never Order

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/customers-who-never-order/

## Problem Description

Write a solution to find all customers who never order anything.

Return the result table in **any order**.

## Table Schema

**Table: Customers**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key for this table.

**Table: Orders**

| Column Name | Type |
|-------------|------|
| id          | int  |
| customerId  | int  |

`id` is the primary key for this table. `customerId` is a foreign key referencing `Customers.id`.

## Example

**Input:**

Customers table:
| id | name  |
|----|-------|
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |

Orders table:
| id | customerId |
|----|------------|
| 1  | 3          |
| 2  | 1          |

**Output:**
| Customers |
|-----------|
| Henry     |
| Max       |

## Solution

Use a `LEFT JOIN` between `Customers` and `Orders` and filter for rows where there is no matching order (`Orders.id IS NULL`).

```sql
SELECT Customers.name AS Customers 
FROM Customers
LEFT JOIN Orders
ON Orders.customerId = Customers.id
WHERE Orders.id IS NULL;
```
