SELECT
-- eshita53
contest_id,
ROUND(COUNT(Distinct user_id) * 100 / (SELECT COUNT(user_id) from Users), 2) as percentage
From Register
Group by contest_id
Order BY percentage DESC,
 contest_id 

