# Write your MySQL query statement below
-- eshita53
SELECT 
P.product_id,
ifnull(
round(
SUM(P.price *U.units)/SUM(U.units), 2),0)
as average_price
FROM Prices as P
LEFT JOIN UnitsSold as U
ON P.product_id = U.product_id
AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id

