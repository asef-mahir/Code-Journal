/*Problem link: https://leetcode.com/problems/game-play-analysis-iv/ 
Statement: Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
In other words, determine the number of players who logged in on the day immediately following their initial login, divided by the total number of players.

Note:
- (player_id, event_date) is the primary key.
- Need to find first login date per player, then check if they logged in the next day.

┌─────────────────────────────────────────────────────────────────────┐
│                            Activity                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ player_id       │ int                                               │
│ device_id       │ int                                               │
│ event_date      │ date                                              │
│ games_played    │ int                                               │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (player_id, event_date)

Sample Data:
┌───────────┬───────────┬────────────┬──────────────┐
│ player_id │ device_id │ event_date │ games_played │
├───────────┼───────────┼────────────┼──────────────┤
│ 1         │ 2         │ 2016-03-01 │ 5            │
│ 1         │ 2         │ 2016-03-02 │ 6            │
│ 2         │ 3         │ 2017-06-25 │ 1            │
│ 3         │ 1         │ 2016-03-02 │ 0            │
│ 3         │ 4         │ 2018-07-03 │ 5            │
└───────────┴───────────┴────────────┴──────────────┘

Sample Output:
┌──────────┐
│ fraction │
├──────────┤
│ 0.33     │
└──────────┘
*/

---------   APPROACH 1: Tuple IN Method ---------

# Write your MySQL query statement below
SELECT ROUND(COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity) , 2) AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date , INTERVAL 1 DAY)) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
)

-- DATE_SUB() will subtract 1 day from the event_date, so we are checking if there is a login on the day after the first login date for each player.
-- DATE_SUB() format: DATE_SUB(date, INTERVAL value unit) eg, DATE_SUB('2016-03-02', INTERVAL 2 MONTH) will return '2016-01-02'.
-- The subquery will return the first login date for each player.
-- in the first line, (SELECT COUNT(DISTINCT player_id) FROM Activity) is a subquery, that's why it's in parentheses. it is a scalar subquery that returns the total number of unique players.



---------   APPROACH 2: Self Join Method ---------

# Write your MySQL query statement below
SELECT ROUND(COUNT(f.player_id) / COUNT(DISTINCT a.player_id),2) AS fraction
FROM Activity a LEFT JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
ON a.player_id = f.player_id
AND DATEDIFF(a.event_date, f.first_login) = 1;


-- LEFT Join with a temporary Derived table (f) that contains the first login date for each player. The subquery returns (player_id, first_login_date) for every player.
-- DATEDIFF() will return the difference in days between two dates
-- DATEDIFF() format: DATEDIFF(date1, date2) eg, DATEDIFF('2016-03-02', '2016-03-01') will return 1.
-- In the first line, COUNT(DISTINCT a.player_id) is used to count the total number of unique players, while COUNT(f.player_id) counts the number of players who logged in on the day after their first login.