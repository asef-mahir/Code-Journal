/*Problem link: https://leetcode.com/problems/consecutive-numbers/
Statement: Find all numbers that appear at least three times consecutively.
Return the result table in any order.

Note: id is an autoincrement column starting from 1.
┌─────────────────────────────────────┐
│               Logs                  │
├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │
│ num             │ varchar           │
└─────────────────┴───────────────────┘
Sample Data:
┌────┬─────┐
│ id │ num │
├────┼─────┤
│ 1  │ 1   │
│ 2  │ 1   │
│ 3  │ 1   │
│ 4  │ 2   │
│ 5  │ 1   │
│ 6  │ 2   │
│ 7  │ 2   │
└────┴─────┘
Sample Output:
┌─────────────────┐
│ ConsecutiveNums │
├─────────────────┤
│ 1               │
└─────────────────┘
*/

# Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums

FROM Logs l1, Logs l2, Logs l3          -- Cross join (Self-join) to compare three consecutive rows
WHERE l2.id = l1.id + 1 AND             
      l3.id = l2.id + 1 AND
      l1.num = l2.num AND
      l2.num = l3.num;

-- Explanation:
-- check if rows are consecutive by comparing their ids (l2.id = l1.id + 1 and l3.id = l2.id + 1)
-- check if the num values are the same for the three consecutive rows (l1.num = l2.num and l2.num = l3.num)