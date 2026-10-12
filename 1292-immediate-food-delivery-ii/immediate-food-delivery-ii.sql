# Write your MySQL query statement below
-- WITH CustomerFirst AS 
-- (SELECT 
-- -- eshita53
-- *
-- FROM Delivery
-- WHERE (customer_id, order_date) in ( SELECT
-- customer_id,
-- MIN(order_date) as first_order
-- From Delivery
-- GROUP BY customer_id
-- ))
SELECT 
Round(AVG(order_date = customer_pref_delivery_date 
) *100, 2)
AS immediate_percentage
FROM Delivery
where (customer_id, order_date) in (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
)