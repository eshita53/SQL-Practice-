# Write your MySQL query statement below

SELECT *
FROM CINEMA as C
WHERE C.id % 2 != 0 AND C.description <> "boring"
ORDER BY C.rating DESC
