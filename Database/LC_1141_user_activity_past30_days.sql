/*Problem link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
Statement: Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on a day if they made at least one activity on that day. Return the result table in any order.

Note:
- This table may have duplicate rows.
- activity_type is ENUM of ('open_session', 'end_session', 'scroll_down', 'send_message').
- Each session belongs to exactly one user.

┌─────────────────────────────────────────────────────────────────────┐
│                            Activity                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ user_id         │ int                                               │
│ session_id      │ int                                               │
│ activity_date   │ date                                              │
│ activity_type   │ enum ('open_session', 'end_session', 'scroll_down', 'send_message') │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────────┬────────────┬───────────────┬───────────────┐
│ user_id │ session_id │ activity_date │ activity_type │
├─────────┼────────────┼───────────────┼───────────────┤
│ 1       │ 1          │ 2019-07-20    │ open_session  │
│ 1       │ 1          │ 2019-07-20    │ scroll_down   │
│ 1       │ 1          │ 2019-07-20    │ end_session   │
│ 2       │ 4          │ 2019-07-20    │ open_session  │
│ 2       │ 4          │ 2019-07-21    │ send_message  │
│ 2       │ 4          │ 2019-07-21    │ end_session   │
│ 3       │ 2          │ 2019-07-21    │ open_session  │
│ 3       │ 2          │ 2019-07-21    │ send_message  │
│ 3       │ 2          │ 2019-07-21    │ end_session   │
│ 4       │ 3          │ 2019-06-25    │ open_session  │
│ 4       │ 3          │ 2019-06-25    │ end_session   │
└─────────┴────────────┴───────────────┴───────────────┘

Sample Output:
┌────────────┬──────────────┐
│ day        │ active_users │
├────────────┼──────────────┤
│ 2019-07-20 │ 2            │
│ 2019-07-21 │ 2            │
└────────────┴──────────────┘
*/

# Write your MySQL query statement below
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


-- we can also write: WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27' (Past 1 month - so, 28 june to 27 july -- total 30 days, 27 july inclusive)