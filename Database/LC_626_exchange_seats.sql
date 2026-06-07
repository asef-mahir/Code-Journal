/*Problem link: https://leetcode.com/problems/exchange-seats/
Statement: Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. Return the result table ordered by id in ascending order.

Note:
- id is the primary key.
- ID sequence starts from 1 and increments continuously.

┌─────────────────────────────────────┐
│               Seat                  │
├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │
│ student         │ varchar           │
└─────────────────┴───────────────────┘

Sample Data:
┌────┬─────────┐
│ id │ student │
├────┼─────────┤
│ 1  │ Abbot   │
│ 2  │ Doris   │
│ 3  │ Emerson │
│ 4  │ Green   │
│ 5  │ Jeames  │
└────┴─────────┘

Sample Output:
┌────┬─────────┐
│ id │ student │
├────┼─────────┤
│ 1  │ Doris   │
│ 2  │ Abbot   │
│ 3  │ Green   │
│ 4  │ Emerson │
│ 5  │ Jeames  │
└────┴─────────┘
*/

# Write your MySQL query statement below
SELECT id, 
CASE WHEN 
id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
ELSE 
COALESCE(LEAD(student) OVER(ORDER BY id), student)
END As student
FROM Seat
ORDER BY id;



-- Core logic: odd ids take the next student's name, even ids take the previous student's name to swap seats.
-- CASE WHEN is used to check whether the current id is odd or even.
-- LAG() gets the previous row value and LEAD() gets the next row value using WINDOW FUNCTIONS.
-- OVER(ORDER BY id) defines the window order so SQL knows the row sequence for LAG/LEAD.
-- COALESCE() : it returns the first non-NULL value among its arguments. In this case, if LEAD() returns NULL (which happens for the last odd row), COALESCE() will return the current student's name, effectively keeping it unchanged.
-- so, COALESCE() handles NULL values; for the last odd row it keeps the same student if no next row exists.
