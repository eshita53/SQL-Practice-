# Write your MySQL query statement below

-- WITH InitialLogIn AS (
-- SELECT *
-- --eshita53
-- FROM Activity
-- WHERE (player_id,event_date) IN (  SELECT 
--     player_id,
--     MIN(event_date)
--     FROM Activity 
--     GROUP BY player_id
-- )
-- )

-- SELECT 
-- ROUND(
--     SUM(
--         CASE WHEN  DATEDIFF(a.event_date, i.event_date) = 1 THEN 1
--         ELSE 0 END
--     ) / 
--     (SELECT COUNT(DISTINCT player_id) FROM Activity)
    
--     ,2) AS fraction
-- FROM Activity a
-- JOIN InitialLogIn i
-- on a.player_id = i.player_id 
-- -- WHERE  DATEDIFF(a.event_date, i.event_date) = 1 

SELECT 
-- eshita53
ROUND(
    COUNT(a1.player_id)/ (SELECT COUNT(DISTINCT(player_id)) FROM Activity)
    ,2) AS fraction
FROM (
    SELECT player_id,
    MIN(event_date) as event_date
    FROM Activity
    GROUP BY player_id
) a1
JOIN Activity a2
ON a1.player_id = a2.player_id 
AND
DATEDIFF(a2.event_date, a1.event_date) = 1


