# Write your MySQL query statement below
WITH CustomerFirst AS 
(SELECT *
FROM Delivery
WHERE (customer_id, order_date) in ( SELECT
customer_id,
MIN(order_date) as first_order
From Delivery
GROUP BY customer_id
))
SELECT 
Round(SUM(
CASE WHEN  CustomerFirst.order_date = CustomerFirst.customer_pref_delivery_date THEN 1
ELSE 0 END
) *100 / (SELECT COUNT(customer_id) FROM CustomerFirst), 2)
AS immediate_percentage
FROM CustomerFirst