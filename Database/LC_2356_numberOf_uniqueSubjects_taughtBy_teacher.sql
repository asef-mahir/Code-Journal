/* Problem: Number of Unique Subjects Taught by Each Teacher
Difficulty: Easy
Problem Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/

SQL Schema
Table: Teacher
+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.

Example 1:

Input: 
Teacher table:
+------------+------------+---------+
| teacher_id | subject_id | dept_id |
+------------+------------+---------+
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |
+------------+------------+---------+
Output:  
+------------+-----+
| teacher_id | cnt |
+------------+-----+
| 1          | 2   |
| 2          | 4   |
+------------+-----+
Explanation: 
Teacher 1:
  - They teach subject 2 in departments 3 and 4.
  - They teach subject 3 in department 3.
Teacher 2:
  - They teach subject 1 in department 1.
  - They teach subject 2 in department 1.
  - They teach subject 3 in department 1.
  - They teach subject 4 in department 1.
*/

--Logic: We can achieve this by using the COUNT(DISTINCT subject_id), which counts the number of unique subject_ids for each teacher_id. We will group the results by teacher_id to get the count for each teacher.
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

/*Execution Order:
1. FROM
2. The GROUP BY (groups the records by teacher_id)
3. The COUNT(DISTINCT subject_id) is executed for each group, counting the
   number of unique subject_ids for each teacher_id.
4. Finally, the SELECT clause is executed, which returns the teacher_id and the count of unique subjects (cnt) for each teacher.
*/
