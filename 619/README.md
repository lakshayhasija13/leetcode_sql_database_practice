# 619. Biggest Single Number

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/biggest-single-number/

## Problem Description

A **single number** is a number that appeared only once in the `MyNumbers` table.

Find the largest **single number**. If there is no single number, report `null`.

## Table Schema

**Table: MyNumbers**

| Column Name | Type |
|-------------|------|
| num         | int  |

This table may contain duplicates. Each row contains a number.

## Example

**Input:**

MyNumbers table:
| num |
|-----|
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |

**Output:**
| num |
|-----|
| 6   |

**Input (no single number):**

MyNumbers table:
| num |
|-----|
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |

**Output:**
| num  |
|------|
| null |

## Solution

Use a CTE to count occurrences of each number, then select the maximum number where the count is exactly 1. If no such number exists, `MAX` returns `null`.

```sql
WITH t AS (
SELECT num, COUNT(*) AS count
FROM MyNumbers
GROUP BY num)
SELECT MAX(num) AS num
FROM t 
WHERE count = 1;
```
