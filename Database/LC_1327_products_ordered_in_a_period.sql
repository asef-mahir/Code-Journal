/*Problem link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/ 
Statement: Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. Return the result table in any order.

Note:
- product_id is the primary key in Products table.
- product_id in Orders is a foreign key to Products.
- Orders table may contain duplicate rows.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│             Products                │     │              Orders                 │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ product_id      │ int (Primary Key) │     │ product_id      │ int (FK)          │
│ product_name    │ varchar           │     │ order_date      │ date              │
│ product_category│ varchar           │     │ unit            │ int               │
└─────────────────┴───────────────────┘     └─────────────────┴───────────────────┘
                                            (May contain duplicate rows)

Sample Data - Products:
┌────────────┬───────────────────────┬──────────────────┐
│ product_id │ product_name          │ product_category │
├────────────┼───────────────────────┼──────────────────┤
│ 1          │ Leetcode Solutions    │ Book             │
│ 2          │ Jewels of Stringology │ Book             │
│ 3          │ HP                    │ Laptop           │
│ 4          │ Lenovo                │ Laptop           │
│ 5          │ Leetcode Kit          │ T-shirt          │
└────────────┴───────────────────────┴──────────────────┘

Sample Data - Orders:
┌────────────┬────────────┬──────┐
│ product_id │ order_date │ unit │
├────────────┼────────────┼──────┤
│ 1          │ 2020-02-05 │ 60   │
│ 1          │ 2020-02-10 │ 70   │
│ 2          │ 2020-01-18 │ 30   │
│ 2          │ 2020-02-11 │ 80   │
│ 3          │ 2020-02-17 │ 2    │
│ 3          │ 2020-02-24 │ 3    │
│ 4          │ 2020-03-01 │ 20   │
│ 4          │ 2020-03-04 │ 30   │
│ 4          │ 2020-03-04 │ 60   │
│ 5          │ 2020-02-25 │ 50   │
│ 5          │ 2020-02-27 │ 50   │
│ 5          │ 2020-03-01 │ 50   │
└────────────┴────────────┴──────┘

Sample Output:
┌────────────────────┬──────┐
│ product_name       │ unit │
├────────────────────┼──────┤
│ Leetcode Solutions │ 130  │
│ Leetcode Kit       │ 100  │
└────────────────────┴──────┘
*/

-- Write your PostgreSQL query statement below
WITH temp AS (
    SELECT p.product_name , SUM(o.unit) AS unit
    FROM Products p JOIN Orders o
    ON p.product_id = o.product_id
    WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY p.product_id, p.product_name
    HAVING SUM(o.unit) >= 100
)
SELECT *
FROM temp;