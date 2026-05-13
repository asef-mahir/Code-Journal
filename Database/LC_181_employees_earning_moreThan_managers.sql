/* Problem: Employees Earning More Than Their Managers
 * Difficulty: Easy
 * Problem Link: https://leetcode.com/problems/employees-earning-more-than-their-managers/
 * SQL Schema:
 * 
 * Table: Employee
 * +-------------+---------+
 * | Column Name | Type    |
 * +-------------+---------+
 * | id          | int     |
 * | name        | varchar |
 * | salary      | int     |
 * | managerId   | int     |
 * +-------------+---------+
 * id is the primary key of this table.
 * managerId is the foreign key from Employee.id.
 *
 * Write an SQL query to find the employees who earn more than their managers.
 *
 *
 * Example 1:
 *
 * Input: Employee table:
 * +----+-------+--------+-----------+
 * | id | name  | salary | managerId |
 * +----+-------+--------+-----------+
 * | 1  | Joe   | 70000  | 3         |
 * | 2  | Henry | 80000  | 4         |
 * | 3  | Sam   | 60000  | NULL      |
 * | 4  | Max   | 90000  | NULL      |
 * +----+-------+--------+-----------+
 *
 * Output: 
 * +----------+
 * | Employee |
 * +----------+
 * | Joe      |
 * +----------+
 *
 */

--Logic: Used a self join to compare employees to their manager rows.
SELECT e1.name AS Employee
FROM Employee e1
INNER JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;