# 197. Rising Temperature

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/rising-temperature/

## Problem Description

Write a solution to find all dates' `id` with higher temperatures compared to the previous day (yesterday).

Return the result table in **any order**.

## Table Schema

**Table: Weather**

| Column Name | Type |
|-------------|------|
| id          | int  |
| recordDate  | date |
| temperature | int  |

`id` is the primary key for this table. Each row contains information about the temperature on a given day.

## Example

**Input:**

Weather table:
| id | recordDate | temperature |
|----|------------|-------------|
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

**Output:**
| id |
|----|
| 2  |
| 4  |

## Solution

Self-join the `Weather` table matching each row with the previous day's row using `INTERVAL '1 day'`, then filter for rows where today's temperature exceeds yesterday's.

```sql
SELECT w1.id 
FROM Weather AS w1
JOIN Weather AS w2 
ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;
```
