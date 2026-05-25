/*Problem link: https://leetcode.com/problems/students-and-examinations/ (LeetCode 1280)
Statement: Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.

Note: 
- student_id is the primary key in Students table.
- subject_name is the primary key in Subjects table.
- Examinations table has no primary key and may contain duplicates.
- Each student from Students table takes every course from Subjects table.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│             Students                │     │             Subjects                │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ student_id      │ int (Primary Key) │     │ subject_name    │ varchar (PK)      │
│ student_name    │ varchar           │     └─────────────────┴───────────────────┘
└─────────────────┴───────────────────┘

┌─────────────────────────────────────┐
│           Examinations              │
├─────────────────┬───────────────────┤
│ student_id      │ int               │
│ subject_name    │ varchar           │
└─────────────────┴───────────────────┘
(No primary key, may contain duplicates)

Sample Data - Students:
┌────────────┬──────────────┐
│ student_id │ student_name │
├────────────┼──────────────┤
│ 1          │ Alice        │
│ 2          │ Bob          │
│ 13         │ John         │
│ 6          │ Alex         │
└────────────┴──────────────┘

Sample Data - Subjects:
┌──────────────┐
│ subject_name │
├──────────────┤
│ Math         │
│ Physics      │
│ Programming  │
└──────────────┘

Sample Data - Examinations:
┌────────────┬──────────────┐
│ student_id │ subject_name │
├────────────┼──────────────┤
│ 1          │ Math         │
│ 1          │ Physics      │
│ 1          │ Programming  │
│ 2          │ Programming  │
│ 1          │ Physics      │
│ 1          │ Math         │
│ 13         │ Math         │
│ 13         │ Programming  │
│ 13         │ Physics      │
│ 2          │ Math         │
│ 1          │ Math         │
└────────────┴──────────────┘

Sample Output:
┌────────────┬──────────────┬──────────────┬────────────────┐
│ student_id │ student_name │ subject_name │ attended_exams │
├────────────┼──────────────┼──────────────┼────────────────┤
│ 1          │ Alice        │ Math         │ 3              │
│ 1          │ Alice        │ Physics      │ 2              │
│ 1          │ Alice        │ Programming  │ 1              │
│ 2          │ Bob          │ Math         │ 1              │
│ 2          │ Bob          │ Physics      │ 0              │
│ 2          │ Bob          │ Programming  │ 1              │
│ 6          │ Alex         │ Math         │ 0              │
│ 6          │ Alex         │ Physics      │ 0              │
│ 6          │ Alex         │ Programming  │ 0              │
│ 13         │ John         │ Math         │ 1              │
│ 13         │ John         │ Physics      │ 1              │
│ 13         │ John         │ Programming  │ 1              │
└────────────┴──────────────┴──────────────┴────────────────┘
*/

# Write your MySQL query statement below
SELECT S.student_id, S.student_name, SU.subject_name, COUNT(E.student_id) AS attended_exams
FROM Students S CROSS JOIN Subjects SU
LEFT JOIN Examinations E
ON S.student_id = E.student_id AND SU.subject_name = E.subject_name
GROUP BY S.student_id, S.student_name, SU.subject_name
ORDER BY S.student_id, SU.subject_name;


-- CROSS JOIN is used instead of comma join for better readability and to avoid SQL join precedence issues. (we used A CROSS B instead of A,B)
-- because if we used A,B -> it would be interpredted as A CROSS (B LEFT JOIN C) which is not what we want.
-- It explicitly creates every possible student-subject combination required by the problem.
-- LEFT JOIN keeps combinations where a student did not attend a subject, producing NULL values.
-- COUNT(E.student_id) is used instead of COUNT(*) because COUNT(column) ignores NULL values.
-- This correctly returns 0 for subjects not attended, while COUNT(*) would incorrectly count those rows as 1.