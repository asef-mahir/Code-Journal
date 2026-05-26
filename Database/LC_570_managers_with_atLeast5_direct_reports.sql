/*Problem link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
Statement: Write a solution to find managers with at least five direct reports.
Return the result table in any order.

Note: 
- id is the primary key.
- managerId refers to the id of the employee's manager.
- If managerId is null, the employee does not have a manager.
- No employee will be the manager of themself.

┌─────────────────────────────────────────────────────┐
│                    Employee                          │
├─────────────────┬───────────────────────────────────┤
│ id              │ int (Primary Key)                 │
│ name            │ varchar                           │
│ department      │ varchar                           │
│ managerId       │ int (Foreign Key references id)   │
└─────────────────┴───────────────────────────────────┘

Sample Data:
┌─────┬───────┬────────────┬───────────┐
│ id  │ name  │ department │ managerId │
├─────┼───────┼────────────┼───────────┤
│ 101 │ John  │ A          │ null      │
│ 102 │ Dan   │ A          │ 101       │
│ 103 │ James │ A          │ 101       │
│ 104 │ Amy   │ A          │ 101       │
│ 105 │ Anne  │ A          │ 101       │
│ 106 │ Ron   │ B          │ 101       │
└─────┴───────┴────────────┴───────────┘

Sample Output:
┌──────┐
│ name │
├──────┤
│ John │
└──────┘
*/

# Write your MySQL query statement below
SELECT e.name
FROM Employee e INNER JOIN Employee m
ON e.id = m.managerId
GROUP BY e.id
HAVING COUNT(*) >= 5; 