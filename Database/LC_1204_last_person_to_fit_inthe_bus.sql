/*Problem link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
Statement: Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit of 1000 kilograms. 
The first person does not exceed the weight limit. Only one person boards at a time by turn order. Return the result table containing the person_name.

Note:
- person_id contains unique values.
- person_id and turn contain numbers from 1 to n (n = number of rows).
- turn determines boarding order.
- Weight limit is 1000.

┌─────────────────────────────────────────────────────────────────────┐
│                              Queue                                   │
├─────────────────┬───────────────────────────────────────────────────┤
│ person_id       │ int (Unique)                                      │
│ person_name     │ varchar                                           │
│ weight          │ int                                               │
│ turn            │ int (1 to n, order of boarding)                   │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌───────────┬─────────────┬────────┬──────┐
│ person_id │ person_name │ weight │ turn │
├───────────┼─────────────┼────────┼──────┤
│ 5         │ Alice       │ 250    │ 1    │
│ 4         │ Bob         │ 175    │ 5    │
│ 3         │ Alex        │ 350    │ 2    │
│ 6         │ John Cena   │ 400    │ 3    │
│ 1         │ Winston     │ 500    │ 6    │
│ 2         │ Marie       │ 200    │ 4    │
└───────────┴─────────────┴────────┴──────┘

Sample Output:
┌─────────────┐
│ person_name │
├─────────────┤
│ John Cena   │
└─────────────┘
*/

# Write your MySQL query statement below
SELECT q1.person_name
FROM Queue q1 JOIN Queue q2 
ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1;


-- Self-join on q1.turn >= q2.turn pairs each person with everyone who boarded before (or at) their turn.
-- GROUP BY q1.turn + SUM(q2.weight) computes the cumulative weight at each person's turn.
-- HAVING filters out anyone whose cumulative total exceeds the 1000 kg bus limit.
-- ORDER BY cumulative weight DESC + LIMIT 1 picks the last valid boarder (highest running total).