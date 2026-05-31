/*Problem link: https://leetcode.com/problems/fix-names-in-a-table/
Statement: Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase. Return the result table ordered by user_id.

Note:
- user_id is the primary key.
- name consists of only lowercase and uppercase characters.

┌─────────────────────────────────────┐
│               Users                 │
├─────────────────┬───────────────────┤
│ user_id         │ int (Primary Key) │
│ name            │ varchar           │
└─────────────────┴───────────────────┘

Sample Data:
┌─────────┬───────┐
│ user_id │ name  │
├─────────┼───────┤
│ 1       │ aLice │
│ 2       │ bOB   │
└─────────┴───────┘

Sample Output:
┌─────────┬───────┐
│ user_id │ name  │
├─────────┼───────┤
│ 1       │ Alice │
│ 2       │ Bob   │
└─────────┴───────┘
*/

# Write your MySQL query statement below
SELECT user_id, CONCAT(UPPER(SUBSTRING(name,1,1)) , LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;

-- Extract the first character of the name and convert it to uppercase.
-- Extract the remaining characters starting from position 2 and convert them to lowercase.
-- Concatenate both parts to format the name in proper capitalization.
-- SUBSTRING(string, start position, length) is used to extract parts of the string.