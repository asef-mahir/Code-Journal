/*Problem link: https://leetcode.com/problems/count-salary-categories/ 
Statement: Write a solution to calculate the number of bank accounts for each salary category. The categories are:
- "Low Salary": income strictly less than $20000
- "Average Salary": income in inclusive range [$20000, $50000]
- "High Salary": income strictly greater than $50000
The result must contain all three categories. If no accounts in a category, return 0. Return in any order.

Note:
- account_id is the primary key.

┌─────────────────────────────────────┐
│             Accounts                │
├─────────────────┬───────────────────┤
│ account_id      │ int (Primary Key) │
│ income          │ int               │
└─────────────────┴───────────────────┘

Sample Data:
┌────────────┬────────┐
│ account_id │ income │
├────────────┼────────┤
│ 3          │ 108939 │
│ 2          │ 12747  │
│ 8          │ 87709  │
│ 6          │ 91796  │
└────────────┴────────┘

Sample Output:
┌────────────────┬────────────────┐
│ category       │ accounts_count │
├────────────────┼────────────────┤
│ Low Salary     │ 1              │
│ Average Salary │ 0              │
│ High Salary    │ 3              │
└────────────────┴────────────────┘
*/


# Write your MySQL query statement below
SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION

SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000

UNION

SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000



-- used UNION
-- in select statement, we can use string to represent the category and count the number of accounts in each category by using COUNT(*)