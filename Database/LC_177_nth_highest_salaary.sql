/*Problem link: https://leetcode.com/problems/nth-highest-salary/
Statement: Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

Note: id is the primary key. Each row contains information about the salary of an employee.
┌─────────────────────────────────────┐
│             Employee                │
├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │
│ salary          │ int               │
└─────────────────┴───────────────────┘

Sample Data 1:
┌────┬────────┐
│ id │ salary │
├────┼────────┤
│ 1  │ 100    │
│ 2  │ 200    │
│ 3  │ 300    │
└────┴────────┘
n = 2

Sample Output 1:
┌────────────────────────+
│ getNthHighestSalary(2) │
├────────────────────────┤
│ 200                    │
└────────────────────────┘

Sample Data 2:
┌────┬────────┐
│ id │ salary │
├────┼────────┤
│ 1  │ 100    │
└────┴────────┘
n = 2

Sample Output 2:
┌────────────────────────+
│ getNthHighestSalary(2) │
├────────────────────────┤
│ null                   │
└────────────────────────┘
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N -1;           -- IMPORTANT: N should be one less cz if we go for 5th highest salary, we need to skip 4 rows (offset 4)
  RETURN (
      # Write your MySQL query statement below.
      
      SELECT DISTINCT salary           
      FROM Employee 
      ORDER BY salary DESC
      LIMIT 1 OFFSET N
      
  );
END


--Just one salary has to be returned, tht's why we used DISTINCT
-- we can't write OFFSET N-1 because we can't use an expression in the OFFSET clause, so we have to set N = N - 1 before the return statement.
