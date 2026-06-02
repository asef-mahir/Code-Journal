/*Problem link: https://leetcode.com/problems/product-sales-analysis-iii/ 
Statement: Write a solution to find all sales that occurred in the first year each product was sold. For each product_id, identify the earliest year it appears in the Sales table. 
Return all sales entries for that product in that year. Return the result table with columns: product_id, first_year, quantity, price. Return in any order.

Note:
- (sale_id, year) is the primary key.
- A product may have multiple sales entries in the same year.

┌─────────────────────────────────────────────────────────────────────┐
│                              Sales                                   │
├─────────────────┬───────────────────────────────────────────────────┤
│ sale_id         │ int                                               │
│ product_id      │ int                                               │
│ year            │ int                                               │
│ quantity        │ int                                               │
│ price           │ int                                               │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (sale_id, year)

Sample Data:
┌─────────┬────────────┬──────┬──────────┬───────┐
│ sale_id │ product_id │ year │ quantity │ price │
├─────────┼────────────┼──────┼──────────┼───────┤
│ 1       │ 100        │ 2008 │ 10       │ 5000  │
│ 2       │ 100        │ 2009 │ 12       │ 5000  │
│ 7       │ 200        │ 2011 │ 15       │ 9000  │
└─────────┴────────────┴──────┴──────────┴───────┘

Sample Output:
┌────────────┬────────────┬──────────┬───────┐
│ product_id │ first_year │ quantity │ price │
├────────────┼────────────┼──────────┼───────┤
│ 100        │ 2008       │ 10       │ 5000  │
│ 200        │ 2011       │ 15       │ 9000  │
└────────────┴────────────┴──────────┴───────┘
*/


# Write your MySQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
)

-- used a non-correlated subquery (independent of the outer query)  to find the minimum year for each product id
-- then used the result of the subquery to filter the main query to get the desired output