/*Problem link: https://leetcode.com/problems/product-price-at-a-given-date/ 
Statement: Write a solution to find the prices of all products on the date 2019-08-16. Initially, all products have price 10. Return the result table in any order.

Note:
- (product_id, change_date) is the primary key.
- Each row indicates a price change on a date.
- If no price change before or on 2019-08-16, price remains 10 (initial).

┌─────────────────────────────────────────────────────────────────────┐
│                            Products                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ product_id      │ int                                               │
│ new_price       │ int                                               │
│ change_date     │ date                                              │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (product_id, change_date)

Sample Data:
┌────────────┬───────────┬─────────────┐
│ product_id │ new_price │ change_date │
├────────────┼───────────┼─────────────┤
│ 1          │ 20        │ 2019-08-14  │
│ 2          │ 50        │ 2019-08-14  │
│ 1          │ 30        │ 2019-08-15  │
│ 1          │ 35        │ 2019-08-16  │
│ 2          │ 65        │ 2019-08-17  │
│ 3          │ 20        │ 2019-08-18  │
└────────────┴───────────┴─────────────┘

Sample Output:
┌────────────┬───────┐
│ product_id │ price │
├────────────┼───────┤
│ 2          │ 50    │
│ 1          │ 35    │
│ 3          │ 10    │
└────────────┴───────┘
*/

# Write your MySQL query statement below
SELECT product_id , new_price AS price
FROM Products
WHERE (product_id , change_date) IN (
    SELECT product_id , MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
)


-- Explanation:
-- The first part of the query selects the latest price for each product on or before the date
-- '2019-08-16' by using a subquery that groups by product_id and finds the maximum change_date.
-- The second part of the query selects products that have no price changes on or before '2019-08-16' and assigns them the initial price of 10. 
-- The UNION operator combines the results from both parts to give the final output.


-- **IMPORTANT: we've to use just product_id in the second part of the query to avoid duplicates, as there could be multiple entries for the same product_id in the Products table.
-- for instance, above sample data, product_id 1 has multiple entries, but we only want to check if it has any price change on or before '2019-08-16' and not consider all entries for that product_id.
-- if we had used (product_id, change_date) in the second part of the query, it would have resulted in duplicates
-- because the Products table may contain multiple rows for the same product_id with different change_date values.
-- We only need to check whether a product has any price update before or on '2019-08-16'.
-- If not, we return the default price 10 exactly once for that product.