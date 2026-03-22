WITH t AS (
SELECT num, COUNT(*) AS count
FROM MyNumbers
GROUP BY num)
SELECT MAX(num) AS num
FROM t 
WHERE count = 1;
