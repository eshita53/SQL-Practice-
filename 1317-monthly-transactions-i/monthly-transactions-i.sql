# Write your MySQL query statement below

SELECT
-- EXTRACT(YEAR_MONTH FROM trans_date)  as month,
DATE_FORMAT(trans_date, '%Y-%m') AS month,
-- FORMAT(trans_date, 'yy-MM')  as month,
country,
Count(amount) as trans_count,
SUM(
    CASE when state = "approved" Then 1
    ELSE 0 END
) as approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE
WHEN state = "approved" THEN amount
ELSE 0 END ) as approved_total_amount
FROM Transactions
GROUP BY month, Country