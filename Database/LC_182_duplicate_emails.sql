/* Problem: Duplicate Emails
-- Given a table Person, which holds the details of the person, including their email address.
-- Write a SQL query to find all the duplicate email addresses in the Person table.
-- Problem Link: https://leetcode.com/problems/duplicate-emails/

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;