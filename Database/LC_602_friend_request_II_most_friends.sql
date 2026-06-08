/*Problem link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
Statement: Write a solution to find the people who have the most friends and the most friends number. The test cases guarantee only one person has the most friends.

Note:
- (requester_id, accepter_id) is the primary key.
- A friend relationship is counted when a user either sends or receives a friend request that gets accepted.

┌─────────────────────────────────────────────────────────────────────┐
│                        RequestAccepted                               │
├─────────────────┬───────────────────────────────────────────────────┤
│ requester_id    │ int                                               │
│ accepter_id     │ int                                               │
│ accept_date     │ date                                              │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (requester_id, accepter_id)

Sample Data:
┌──────────────┬─────────────┬─────────────┐
│ requester_id │ accepter_id │ accept_date │
├──────────────┼─────────────┼─────────────┤
│ 1            │ 2           │ 2016/06/03  │
│ 1            │ 3           │ 2016/06/08  │
│ 2            │ 3           │ 2016/06/08  │
│ 3            │ 4           │ 2016/06/09  │
└──────────────┴─────────────┴─────────────┘

Sample Output:
┌────┬─────┐
│ id │ num │
├────┼─────┤
│ 3  │ 3   │
└────┴─────┘
*/

# Write your MySQL query statement below
WITH all_id AS (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)
SELECT id, COUNT(*) as num
FROM all_id
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Explanation:
-- 1. We create a Common Table Expression (CTE) named `all_id` to combine all requester and accepter IDs into a single column named `id`.
-- 2. We then select the `id` and count the number of occurrences (which represents the number of friends) for each `id` from the `all_id` CTE.
-- 3. We group the results by `id` and order them in descending order based on the count of friends.
-- 4. Finally, we limit the result to 1 to get the person with the most friends and their friend count.
-- UNION ALL is used to ensure that we count both the requester and accepter as friends.