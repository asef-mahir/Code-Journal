/*Problem link: https://leetcode.com/problems/biggest-single-number/
Statement: A single number is a number that appeared only once in the MyNumbers table. Find the largest single number. If there is no single number, report null.

Note:
- This table may contain duplicates (no primary key).
- Each row contains an integer.

┌─────────────────────────────────────┐
│             MyNumbers               │
├─────────────────┬───────────────────┤
│ num             │ int               │
└─────────────────┴───────────────────┘

Sample Data 1:
┌─────┐
│ num │
├─────┤
│ 8   │
│ 8   │
│ 3   │
│ 3   │
│ 1   │
│ 4   │
│ 5   │
│ 6   │
└─────┘

Sample Output 1:
┌─────┐
│ num │
├─────┤
│ 6   │
└─────┘

Sample Data 2:
┌─────┐
│ num │
├─────┤
│ 8   │
│ 8   │
│ 7   │
│ 7   │
│ 3   │
│ 3   │
│ 3   │
└─────┘

Sample Output 2:
┌──────┐
│ num  │
├──────┤
│ null │
└──────┘
*/

# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS tb;


-- Used a  SUBQUERY  to find all the single numbers and returned a table named tb.
-- Then, MAX() function is used to fidn the largest single number from the table tb.
