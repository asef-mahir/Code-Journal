/*Problem link: https://leetcode.com/problems/rising-temperature/ (LeetCode 197)
Statement: Write a solution to find all dates' id with higher temperatures compared to its previous date (yesterday). Return the result table in any order.

Note: id is the column with unique values. There are no different rows with the same recordDate.

┌─────────────────────────────────────┐
│              Weather                │
├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │
│ recordDate      │ date              │
│ temperature     │ int               │
└─────────────────┴───────────────────┘

Sample Data:
┌────┬────────────┬─────────────┐
│ id │ recordDate │ temperature │
├────┼────────────┼─────────────┤
│ 1  │ 2015-01-01 │ 10          │
│ 2  │ 2015-01-02 │ 25          │
│ 3  │ 2015-01-03 │ 20          │
│ 4  │ 2015-01-04 │ 30          │
└────┴────────────┴─────────────┘

Sample Output:
┌────┐
│ id │
├────┤
│ 2  │
│ 4  │
└────┘
*/

# Write your MySQL query statement below
SELECT w2.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w2.recordDate, w1.recordDate) = 1
      AND w2.temperature > w1.temperature;

--DATEDIFF() function is used to calculate the difference between two dates. It returns the number of days between the two dates.
