# Write your MySQL query statement below

-- SELECT s.user_id,
-- ROUND(AVG (CASE 
--     WHEN c.action = 'confirmed' THEN 1.00
--     ELSE 0
--     END),
-- 2) confirmation_rate
-- FROM Signups as S
-- LEFT JOIN Confirmations as C
-- on S.user_id = C.user_id
-- GROUP BY s.user_id



-- select s.user_id,
-- ifnull
-- (round(
--     sum(case when c.action = "confirmed" then 1
--      else 0 end)
--      /count(c.action),2),0) as confirmation_rate 
--     from Signups s left join
--     Confirmations c on s.user_id=c.user_id 
--     group by s.user_id;


SELECT
-- eshita53
 s.user_id, 
ifnull
(round(
    SUM(case when c.action = "confirmed" then 1
    ELSE 0 
    END)
    / count(c.action),2),0) as confirmation_rate
FROM Signups as s
Left Join Confirmations as c
ON s.user_id = c.user_id
Group BY s.user_id