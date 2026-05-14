/*Problem: Department Highest Salary
Difficulty: Medium
Problem link: https://leetcode.com/problems/department-highest-salary/

SQL Schema:
Table: Employee
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
 
Table: Department
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
*/

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e JOIN Department d ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);

/*Logic:

===========================================
SOLUTION LOGIC BREAKDOWN
===========================================

1. JOIN OPERATION (First)

2. SUBQUERY EXECUTION (For each employee row)
   - This is a CORRELATED subquery (depends on outer query)
   - For EACH employee, find the MAX salary in THEIR department
   - Key: "WHERE departmentId = e.departmentId" makes it correlated
   - Runs multiple times (once per employee row)

3. FILTERING (WHERE clause)
   - Compare each employee's salary with their department's max salary
   - Keep only employees whose salary equals the department maximum
   - This naturally handles ties (multiple employees with same max salary)

4. PROJECTION (SELECT clause)


Execution Trace:
----------------
Subquery Evaluation (runs 5 times):
- For Joe (dept 1):   MAX(70000, 90000, 90000) = 90000
                      70000 = 90000? NO → FILTERED OUT
                      
- For Jim (dept 1):   MAX(70000, 90000, 90000) = 90000
                      90000 = 90000? YES → KEPT
                      
- For Henry (dept 2): MAX(80000, 60000) = 80000
                      80000 = 80000? YES → KEPT
                      
- For Sam (dept 2):   MAX(80000, 60000) = 80000
                      60000 = 80000? NO → FILTERED OUT
                      
- For Max (dept 1):   MAX(70000, 90000, 90000) = 90000
                      90000 = 90000? YES → KEPT

Final Output (3 rows):
| Department | Employee | Salary |
|------------|----------|--------|
| IT         | Jim      | 90000  |
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |

===========================================
KEY CONCEPTS
===========================================

1. CORRELATED SUBQUERY
   - Subquery references outer query's column (e.departmentId)
   - Executes once PER ROW of outer query
   - More expensive than non-correlated subqueries
   
2. HANDLES TIES AUTOMATICALLY
   - If multiple employees have the same max salary in a department
   - All of them will be returned (Jim and Max both have 90000)

3. WHY NOT USE GROUP BY?
   - GROUP BY would collapse rows (1 row per department)
   - We need individual employee details
   - This solution preserves all employee information

*/