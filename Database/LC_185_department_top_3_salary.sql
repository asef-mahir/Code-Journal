/*Problem link: https://leetcode.com/problems/department-top-three-salaries/ 
Statement: Write a solution to find the employees who are high earners in each department. A high earner has a salary in the top three unique salaries for that department. Return the result table in any order.

Note:
- id is the primary key in Employee table.
- departmentId is a foreign key to Department table.
- id is the primary key in Department table.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│             Employee                │     │            Department               │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │     │ id              │ int (Primary Key) │
│ name            │ varchar           │     │ name            │ varchar           │
│ salary          │ int               │     └─────────────────┴───────────────────┘
│ departmentId    │ int (FK)          │
└─────────────────┴───────────────────┘

Sample Data - Employee:
┌────┬───────┬────────┬──────────────┐
│ id │ name  │ salary │ departmentId │
├────┼───────┼────────┼──────────────┤
│ 1  │ Joe   │ 85000  │ 1            │
│ 2  │ Henry │ 80000  │ 2            │
│ 3  │ Sam   │ 60000  │ 2            │
│ 4  │ Max   │ 90000  │ 1            │
│ 5  │ Janet │ 69000  │ 1            │
│ 6  │ Randy │ 85000  │ 1            │
│ 7  │ Will  │ 70000  │ 1            │
└────┴───────┴────────┴──────────────┘

Sample Data - Department:
┌────┬───────┐
│ id │ name  │
├────┼───────┤
│ 1  │ IT    │
│ 2  │ Sales │
└────┴───────┘

Sample Output:
┌────────────┬──────────┬────────┐
│ Department │ Employee │ Salary │
├────────────┼──────────┼────────┤
│ IT         │ Max      │ 90000  │
│ IT         │ Joe      │ 85000  │
│ IT         │ Randy    │ 85000  │
│ IT         │ Will     │ 70000  │
│ Sales      │ Henry    │ 80000  │
│ Sales      │ Sam      │ 60000  │
└────────────┴──────────┴────────┘
*/

# Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
           DENSE_RANK() OVER(
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
           ) AS rnk

    FROM Employee e JOIN Department d
    ON e.departmentId = d.id
) t
WHERE rnk <= 3



-- Explanation:
-- 1. Created a derived table (t) from a subquery with the department name, employee name, salary and the rank of the salary in the department using DENSE_RANK() function.
-- 2. Filtered the table to get only the employees with rank less than or equal to 3
-- ***IMPORTANT***  DENSE_RANK() is used instead of RANK() because if there are multiple employees with the same salary, they should all be considered as high earners and given the same rank. RANK() would skip the next rank(s) after a tie, which is not desired in this case.
-- *** PARTITION BY e.departmentId --> resets ranking per department
-- Partition by is used bcz we can't use group by in this case as we need to get the employee name and salary for each department, and group by would aggregate the results and we would lose the individual employee details. PARTITION BY allows us to calculate the rank for each department separately while still keeping the individual employee details intact.
-- OVER() is used to specify the window for the DENSE_RANK() function, which in this case is partitioned by departmentId and ordered by salary in descending order. 
