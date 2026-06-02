/*Problem link: https://leetcode.com/problems/primary-department-for-each-employee/
Statement: Write a solution to report all the employees with their primary department. For employees who belong to only one department, report their only department. Return the result table in any order.

Note:
- (employee_id, department_id) is the primary key.
- primary_flag is ENUM of ('Y', 'N').
*** When employee belongs to only one department, primary_flag is 'N' for that record.

┌─────────────────────────────────────────────────────────────────────┐
│                            Employee                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ employee_id     │ int                                               │
│ department_id   │ int                                               │
│ primary_flag    │ enum ('Y', 'N')                                   │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (employee_id, department_id)

Sample Data:
┌─────────────┬───────────────┬──────────────┐
│ employee_id │ department_id │ primary_flag │
├─────────────┼───────────────┼──────────────┤
│ 1           │ 1             │ N            │
│ 2           │ 1             │ Y            │
│ 2           │ 2             │ N            │
│ 3           │ 3             │ N            │
│ 4           │ 2             │ N            │
│ 4           │ 3             │ Y            │
│ 4           │ 4             │ N            │
└─────────────┴───────────────┴──────────────┘

Sample Output:
┌─────────────┬───────────────┐
│ employee_id │ department_id │
├─────────────┼───────────────┤
│ 1           │ 1             │
│ 2           │ 1             │
│ 3           │ 3             │
│ 4           │ 3             │
└─────────────┴───────────────┘
*/


# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' OR
employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1
)


-- if employee belongs to only one dept, then that's his only dept, so we keept the row with primary_flag = 'N', otherwise we only keep the row with primary_flag = 'Y'
-- UNION could've been used instead of OR (subquery) but that would've been less efficient though