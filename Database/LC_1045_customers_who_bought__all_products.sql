/*Problem link: https://leetcode.com/problems/customers-who-bought-all-products/ 
Statement: Write a solution to report the customer ids from the Customer table that bought all the products in the Product table. Return the result table in any order.

Note:
- Customer table may contain duplicate rows.
- customer_id is not NULL.
- product_key in Customer is a foreign key to Product table.
- product_key is the primary key in Product table.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│             Customer                │     │              Product                │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ customer_id     │ int               │     │ product_key     │ int (Primary Key) │
│ product_key     │ int (FK)          │     └─────────────────┴───────────────────┘
└─────────────────┴───────────────────┘
(May contain duplicates)

Sample Data - Customer:
┌─────────────┬─────────────┐
│ customer_id │ product_key │
├─────────────┼─────────────┤
│ 1           │ 5           │
│ 2           │ 6           │
│ 3           │ 5           │
│ 3           │ 6           │
│ 1           │ 6           │
└─────────────┴─────────────┘

Sample Data - Product:
┌─────────────┐
│ product_key │
├─────────────┤
│ 5           │
│ 6           │
└─────────────┘

Sample Output:
┌─────────────┐
│ customer_id │
├─────────────┤
│ 1           │
│ 3           │
└─────────────┘
*/


# Write your MySQL query statement below
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product
)


-- i used DISTINCT in the count to avoid counting duplicate purchases of the same product by the same customer. 
-- the subquery counts the total number of unique products available in the product table, and the main query checks if each customer has bought all of those products.