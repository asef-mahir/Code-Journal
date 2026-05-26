/*Problem link: https://leetcode.com/problems/confirmation-rate/
Statement: Write a solution to find the confirmation rate of each user.
The confirmation rate is the number of 'confirmed' messages divided by the total number of requested confirmation messages.
The confirmation rate of a user that did not request any confirmation messages is 0.
Round the confirmation rate to two decimal places.
Return the result table in any order.

Note: 
- user_id is the primary key in Signups table.
- (user_id, time_stamp) is the primary key in Confirmations table.
- user_id in Confirmations is a foreign key to Signups.
- action is an ENUM of ('confirmed', 'timeout')

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│              Signups                │     │           Confirmations             │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ user_id         │ int (Primary Key) │     │ user_id         │ int (FK)          │
│ time_stamp      │ datetime          │     │ time_stamp      │ datetime          │
└─────────────────┴───────────────────┘     │ action          │ ENUM              │
                                            └─────────────────┴───────────────────┘
                                            Primary Key: (user_id, time_stamp)

Sample Data - Signups:
┌─────────┬─────────────────────┐
│ user_id │ time_stamp          │
├─────────┼─────────────────────┤
│ 3       │ 2020-03-21 10:16:13 │
│ 7       │ 2020-01-04 13:57:59 │
│ 2       │ 2020-07-29 23:09:44 │
│ 6       │ 2020-12-09 10:39:37 │
└─────────┴─────────────────────┘

Sample Data - Confirmations:
┌─────────┬─────────────────────┬───────────┐
│ user_id │ time_stamp          │ action    │
├─────────┼─────────────────────┼───────────┤
│ 3       │ 2021-01-06 03:30:46 │ timeout   │
│ 3       │ 2021-07-14 14:00:00 │ timeout   │
│ 7       │ 2021-06-12 11:57:29 │ confirmed │
│ 7       │ 2021-06-13 12:58:28 │ confirmed │
│ 7       │ 2021-06-14 13:59:27 │ confirmed │
│ 2       │ 2021-01-22 00:00:00 │ confirmed │
│ 2       │ 2021-02-28 23:59:59 │ timeout   │
└─────────┴─────────────────────┴───────────┘

Sample Output:
┌─────────┬───────────────────┐
│ user_id │ confirmation_rate │
├─────────┼───────────────────┤
│ 6       │ 0.00              │
│ 3       │ 0.00              │
│ 7       │ 1.00              │
│ 2       │ 0.50              │
└─────────┴───────────────────┘
*/

# Write your MySQL query statement below
SELECT s.user_id, IFNULL(ROUND(AVG(c.action = 'confirmed'), 2), 0) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;


-- Explanation:
-- LEFT JOIN is used to keep all users from Signups, even those without confirmation records.
-- (c.action = 'confirmed') evaluates to 1 for confirmed actions and 0 otherwise.
-- AVG() automatically computes confirmed_actions / total_actions.
-- ** IFNULL handles users with no confirmations by returning 0 instead of NULL.
-- GROUP BY user_id ensures one final confirmation rate per user.
-- AVOID MISTAKE: avoid using column from the right table after performing LEFT JOIN 
-- cz it may return NULL for users without confirmation records
-- mistake i did was using c.user_id in the SELECT clause instead of using s.user_id