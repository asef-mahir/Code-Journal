/*Problem: Second Highest Salary
Difficulty: Medium
Problem Link: https://leetcode.com/problems/second-highest-salary/

SQL Schema
Table: Employee
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

--Logic: Used a subquery to select distinct salaries. Ordered them in descending order and used LIMIT with OFFSET to get the second highest salary. If there is no second highest salary, it will return null.
SELECT(
    SELECT DISTINCT salary 
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

/*
DISTINCT: it is used to stop duplicates from being considered as second highest
LIMIT: it is used to limit the number of rows returned by the query. In this case, we are limiting it to 1 row.
OFFSET: it is used to skip a specified number of rows before starting to return rows from the query.

Execution Order:
1. FROM (Employee)
2. SELECT DISTINCT (salary)
3. ORDER BY (salary DESC)
4. OFFSET 1 (Skip highest) -> LIMIT 1 (Take second)
*/
-- offset is executed before limit, so it skips the highest salary and then limit returns the next one which is the second highest salary.

