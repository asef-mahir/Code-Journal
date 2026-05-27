/*Problem link: https://leetcode.com/problems/monthly-transactions-i/
Statement: Write a solution to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount. Return the result table in any order.

Note:
- id is the primary key.
- state is an ENUM of ('approved', 'declined').

┌─────────────────────────────────────────────────────────────────────┐
│                         Transactions                                 │
├─────────────────┬───────────────────────────────────────────────────┤
│ id              │ int (Primary Key)                                 │
│ country         │ varchar                                           │
│ state           │ enum ('approved', 'declined')                     │
│ amount          │ int                                               │
│ trans_date      │ date                                              │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────┬─────────┬──────────┬────────┬────────────┐
│ id  │ country │ state    │ amount │ trans_date │
├─────┼─────────┼──────────┼────────┼────────────┤
│ 121 │ US      │ approved │ 1000   │ 2018-12-18 │
│ 122 │ US      │ declined │ 2000   │ 2018-12-19 │
│ 123 │ US      │ approved │ 2000   │ 2019-01-01 │
│ 124 │ DE      │ approved │ 2000   │ 2019-01-07 │
└─────┴─────────┴──────────┴────────┴────────────┘

Sample Output:
┌─────────┬─────────┬─────────────┬────────────────┬────────────────────┬───────────────────────┐
│ month   │ country │ trans_count │ approved_count │ trans_total_amount │ approved_total_amount │
├─────────┼─────────┼─────────────┼────────────────┼────────────────────┼───────────────────────┤
│ 2018-12 │ US      │ 2           │ 1              │ 3000               │ 1000                  │
│ 2019-01 │ US      │ 1           │ 1              │ 2000               │ 2000                  │
│ 2019-01 │ DE      │ 1           │ 1              │ 2000               │ 2000                  │
└─────────┴─────────┴─────────────┴────────────────┴────────────────────┴───────────────────────┘
*/

# Write your MySQL query statement below
SELECT LEFT(trans_date,7) as month, 
country,  
COUNT(*) AS trans_count,
SUM(state = 'approved') AS approved_count, 
SUM(amount) AS trans_total_amount, 
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount

FROM Transactions
GROUP BY month, country;