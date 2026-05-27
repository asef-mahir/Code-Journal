/*Problem link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
Statement: Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

Note:
- user_id is the primary key in Users table.
- (contest_id, user_id) is the primary key in Register table.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│               Users                 │     │              Register               │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ user_id         │ int (Primary Key) │     │ contest_id      │ int               │
│ user_name       │ varchar           │     │ user_id         │ int               │
└─────────────────┴───────────────────┘     └─────────────────┴───────────────────┘
                                            Primary Key: (contest_id, user_id)

Sample Data - Users:
┌─────────┬───────────┐
│ user_id │ user_name │
├─────────┼───────────┤
│ 6       │ Alice     │
│ 2       │ Bob       │
│ 7       │ Alex      │
└─────────┴───────────┘

Sample Data - Register:
┌────────────┬─────────┐
│ contest_id │ user_id │
├────────────┼─────────┤
│ 215        │ 6       │
│ 209        │ 2       │
│ 208        │ 2       │
│ 210        │ 6       │
│ 208        │ 6       │
│ 209        │ 7       │
│ 209        │ 6       │
│ 215        │ 7       │
│ 208        │ 7       │
│ 210        │ 2       │
│ 207        │ 2       │
│ 210        │ 7       │
└────────────┴─────────┘

Sample Output:
┌────────────┬────────────┐
│ contest_id │ percentage │
├────────────┼────────────┤
│ 208        │ 100.0      │
│ 209        │ 100.0      │
│ 210        │ 100.0      │
│ 215        │ 66.67      │
│ 207        │ 33.33      │
└────────────┴────────────┘
Explanation:
- For contest_id 208, all 3 users registered, so the percentage is 100.0. For contest_id 215, only 2 out of 3 users registered, so the percentage is (2/3)*100 = 66.67 and so on.
*/

# Write your MySQL query statement below
SELECT contest_id, ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM Users),2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;



-- COUNT(*) counts how many users registered for each contest.
-- (SELECT COUNT(*) FROM Users) is a subquery that returns the total number of users
-- *** IMPORTANT: Subquery must be enclosed by parenthesis to ensure it is treated as a single value in the division operation....
-- The percentage is calculated by dividing registered users by total users and multiplying by 100