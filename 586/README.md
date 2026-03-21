# 586. Customer Placing the Largest Number of Orders

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

## Problem Description

Write a solution to find the `customer_number` for the customer who has placed **the largest number of orders**.

The test cases are generated so that **exactly one customer** will have placed more orders than any other customer.

## Table Schema

**Table: Orders**

| Column Name     | Type |
|-----------------|------|
| order_number    | int  |
| customer_number | int  |

`order_number` is the primary key for this table.

## Example

**Input:**

Orders table:
| order_number | customer_number |
|--------------|-----------------|
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |

**Output:**
| customer_number |
|-----------------|
| 3               |

## Solution

Group rows by `customer_number`, order by the count of orders descending, and take the top result with `LIMIT 1`.

```sql
SELECT customer_number 
FROM Orders
GROUP BY customer_number 
ORDER BY COUNT(*) DESC
LIMIT 1;
```
