# 607. Sales Person

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/sales-person/

## Problem Description

Write a solution to find the names of all salespersons who did not have any orders related to the company with the name **"RED"**.

Return the result table in **any order**.

## Table Schema

**Table: SalesPerson**

| Column Name | Type    |
|-------------|---------|
| sales_id    | int     |
| name        | varchar |
| salary      | int     |
| commission_rate | int |
| hire_date   | date    |

`sales_id` is the primary key for this table. Each row indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.

**Table: Company**

| Column Name | Type    |
|-------------|---------|
| com_id      | int     |
| name        | varchar |
| city        | varchar |

`com_id` is the primary key for this table. Each row indicates the name and the ID of a company and the city where the company is located.

**Table: Orders**

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |

`order_id` is the primary key for this table. `com_id` is a foreign key referencing the `Company` table. `sales_id` is a foreign key referencing the `SalesPerson` table.

## Example

**Input:**

SalesPerson table:
| sales_id | name | salary | commission_rate | hire_date  |
|----------|------|--------|-----------------|------------|
| 1        | John | 100000 | 6               | 4/1/2006   |
| 2        | Amy  | 12000  | 5               | 5/1/2010   |
| 3        | Mark | 65000  | 12              | 12/25/2008 |
| 4        | Pam  | 25000  | 25              | 1/1/2005   |
| 5        | Alex | 5000   | 10              | 2/3/2007   |

Company table:
| com_id | name   | city     |
|--------|--------|----------|
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |

Orders table:
| order_id | order_date | com_id | sales_id | amount |
|----------|------------|--------|----------|--------|
| 1        | 1/1/2014   | 3      | 4        | 10000  |
| 2        | 2/1/2014   | 4      | 5        | 5000   |
| 3        | 3/1/2014   | 1      | 1        | 50000  |
| 4        | 4/1/2014   | 1      | 4        | 25000  |

**Output:**
| name |
|------|
| Amy  |
| Mark |
| Alex |

## Solution

### MySQL

Use `LEFT JOIN` to connect `SalesPerson` to `Orders` and `Company`, then group by salesperson and use `HAVING` with `IFNULL` to keep only those with no orders from company 'RED'.

```sql
SELECT s.name
FROM
    SalesPerson AS s
    LEFT JOIN Orders USING (sales_id)
    LEFT JOIN Company AS c USING (com_id)
GROUP BY sales_id
HAVING IFNULL(SUM(c.name = 'RED'), 0) = 0;
```

### PostgreSQL

Use a subquery to find all `sales_id` values linked to company 'RED', then exclude them from the `SalesPerson` table.

```sql
SELECT name 
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id 
    FROM Orders o 
    JOIN Company c ON o.com_id = c.com_id AND c.name = 'RED'
);
```
