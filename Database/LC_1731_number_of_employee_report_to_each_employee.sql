/*Problem link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
Statement: Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, 
and the average age of the reports rounded to the nearest integer. Return the result table ordered by employee_id.

Note:
- employee_id is the primary key.
- reports_to is the id of the manager (null if no manager).
- A manager is an employee who has at least 1 other employee reporting to them.

┌─────────────────────────────────────────────────────────────────────┐
│                            Employees                                 │
├─────────────────┬───────────────────────────────────────────────────┤
│ employee_id     │ int (Primary Key)                                 │
│ name            │ varchar                                           │
│ reports_to      │ int (references employee_id, can be null)         │
│ age             │ int                                               │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data 1:
┌─────────────┬─────────┬────────────┬─────┐
│ employee_id │ name    │ reports_to │ age │
├─────────────┼─────────┼────────────┼─────┤
│ 9           │ Hercy   │ null       │ 43  │
│ 6           │ Alice   │ 9          │ 41  │
│ 4           │ Bob     │ 9          │ 36  │
│ 2           │ Winston │ null       │ 37  │
└─────────────┴─────────┴────────────┴─────┘

Sample Output 1:
┌─────────────┬───────┬───────────────┬─────────────┐
│ employee_id │ name  │ reports_count │ average_age │
├─────────────┼───────┼───────────────┼─────────────┤
│ 9           │ Hercy │ 2             │ 39          │
└─────────────┴───────┴───────────────┴─────────────┘

Sample Data 2:
┌─────────────┬─────────┬────────────┬─────┐
│ employee_id │ name    │ reports_to │ age │
├─────────────┼─────────┼────────────┼─────┤
│ 1           │ Michael │ null       │ 45  │
│ 2           │ Alice   │ 1          │ 38  │
│ 3           │ Bob     │ 1          │ 42  │
│ 4           │ Charlie │ 2          │ 34  │
│ 5           │ David   │ 2          │ 40  │
│ 6           │ Eve     │ 3          │ 37  │
│ 7           │ Frank   │ null       │ 50  │
│ 8           │ Grace   │ null       │ 48  │
└─────────────┴─────────┴────────────┴─────┘

Sample Output 2:
┌─────────────┬─────────┬───────────────┬─────────────┐
│ employee_id │ name    │ reports_count │ average_age │
├─────────────┼─────────┼───────────────┼─────────────┤
│ 1           │ Michael │ 2             │ 40          │
│ 2           │ Alice   │ 2             │ 37          │
│ 3           │ Bob     │ 1             │ 37          │
└─────────────┴─────────┴───────────────┴─────────────┘
*/

# Write your MySQL query statement below
SELECT e1.employee_id, e1.name AS name, COUNT(*) AS reports_count, ROUND(AVG(e2.age)) AS average_age
FROM Employees e1 JOIN Employees e2
ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id;