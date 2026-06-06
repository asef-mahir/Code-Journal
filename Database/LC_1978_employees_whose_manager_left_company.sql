/*Problem link: https://leetcode.com/problems/employees-whose-manager-left-the-company/
Statement: Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves, their information is deleted from the Employees table,
but the reports still have their manager_id set to the manager that left. Return the result table ordered by employee_id.

Note:
- employee_id is the primary key.
- manager_id is null if employee has no manager.
- A manager left if their employee_id no longer exists in the table.

┌─────────────────────────────────────────────────────────────────────┐
│                            Employees                                 │
├─────────────────┬───────────────────────────────────────────────────┤
│ employee_id     │ int (Primary Key)                                 │
│ name            │ varchar                                           │
│ manager_id      │ int (references employee_id, can be null)         │
│ salary          │ int                                               │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────────────┬───────────┬────────────┬────────┐
│ employee_id │ name      │ manager_id │ salary │
├─────────────┼───────────┼────────────┼────────┤
│ 3           │ Mila      │ 9          │ 60301  │
│ 12          │ Antonella │ null       │ 31000  │
│ 13          │ Emery     │ null       │ 67084  │
│ 1           │ Kalel     │ 11         │ 21241  │
│ 9           │ Mikaela   │ null       │ 50937  │
│ 11          │ Joziah    │ 6          │ 28485  │
└─────────────┴───────────┴────────────┴────────┘

Sample Output:
┌─────────────┐
│ employee_id │
├─────────────┤
│ 11          │
└─────────────┘
*/

# Write your MySQL query statement below
SELECT employee_id
FROM Employees
WHERE salary < 30000  AND manager_id is NOT NULL
AND
manager_id NOT IN (
    SELECT employee_id
    FROM Employees
)
ORDER BY employee_id;