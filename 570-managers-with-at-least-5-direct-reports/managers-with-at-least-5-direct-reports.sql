SELECT
-- eshita53
e.name
FROM Employee e
JOIN Employee as b ON 
e.id = b.managerId
Group By b.managerId
HAVING COUNT(b.managerID) >=5


