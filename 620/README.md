# 620. Not Boring Movies

**Difficulty:** Easy  
**Topic:** Database  
**Link:** https://leetcode.com/problems/not-boring-movies/

## Problem Description

Write a solution to report the movies with an **odd-numbered ID** and a description that is **not** `'boring'`.

Return the result table ordered by `rating` in **descending order**.

## Table Schema

**Table: Cinema**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| movie       | varchar |
| description | varchar |
| rating      | float   |

`id` is the primary key for this table. Each row contains information about the name of a movie, its genre, and its rating. `rating` is a 2 decimal places float in the range [0, 10].

## Example

**Input:**

Cinema table:
| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

**Output:**
| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

## Solution

Filter rows where `id` is odd (`id % 2 != 0`) and `description` is not `'boring'`, then sort by `rating` descending.

```sql
SELECT *
FROM Cinema
WHERE description != 'boring'
AND id % 2 != 0
ORDER BY rating DESC;
```
