/*Problem link: https://leetcode.com/problems/patients-with-a-condition/
Statement: Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
Type I Diabetes always starts with DIAB1 prefix. Return the result table in any order.

Note:
- patient_id is the primary key.
- conditions contains 0 or more codes separated by spaces.

┌─────────────────────────────────────────────────────────────────────┐
│                            Patients                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ patient_id      │ int (Primary Key)                                 │
│ patient_name    │ varchar                                           │
│ conditions      │ varchar (codes separated by spaces)               │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌────────────┬──────────────┬──────────────┐
│ patient_id │ patient_name │ conditions   │
├────────────┼──────────────┼──────────────┤
│ 1          │ Daniel       │ YFEV COUGH   │
│ 2          │ Alice        │              │
│ 3          │ Bob          │ DIAB100 MYOP │
│ 4          │ George       │ ACNE DIAB100 │
│ 5          │ Alain        │ DIAB201      │
└────────────┴──────────────┴──────────────┘

Sample Output:
┌────────────┬──────────────┬──────────────┐
│ patient_id │ patient_name │ conditions   │
├────────────┼──────────────┼──────────────┤
│ 3          │ Bob          │ DIAB100 MYOP │
│ 4          │ George       │ ACNE DIAB100 │
└────────────┴──────────────┴──────────────┘
*/

# Write your MySQL query statement below
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';



-- LIKE operator is used in SQL to search for a specified pattern in a column.
-- % is used to match any sequence of characters (including zero characters) in the conditions column.
-- The first condition (conditions LIKE 'DIAB1%') checks if the conditions start with 'DIAB1'.
-- The second condition (conditions LIKE '% DIAB1%') checks if 'DIAB1' appears anywhere in the conditions, preceded by a space (to ensure it's a separate code).