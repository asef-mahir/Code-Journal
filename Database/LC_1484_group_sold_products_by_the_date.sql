/*Problem link: https://leetcode.com/problems/group-sold-products-by-the-date/
Statement: Write a solution to find for each date the number of different products sold and their names. 
The product names for each date should be sorted lexicographically. Return the result table ordered by sell_date.

Note:
- There is no primary key; table may contain duplicates.
- Each row contains product name and date sold.

┌─────────────────────────────────────────────────────────────────────┐
│                           Activities                                 │
├─────────────────┬───────────────────────────────────────────────────┤
│ sell_date       │ date                                              │
│ product         │ varchar                                           │
└─────────────────┴───────────────────────────────────────────────────┘
(No primary key, may contain duplicates)

Sample Data:
┌────────────┬────────────┐
│ sell_date  │ product    │
├────────────┼────────────┤
│ 2020-05-30 │ Headphone  │
│ 2020-06-01 │ Pencil     │
│ 2020-06-02 │ Mask       │
│ 2020-05-30 │ Basketball │
│ 2020-06-01 │ Bible      │
│ 2020-06-02 │ Mask       │
│ 2020-05-30 │ T-Shirt    │
└────────────┴────────────┘

Sample Output:
┌────────────┬──────────┬──────────────────────────────┐
│ sell_date  │ num_sold │ products                     │
├────────────┼──────────┼──────────────────────────────┤
│ 2020-05-30 │ 3        │ Basketball,Headphone,T-Shirt │
│ 2020-06-01 │ 2        │ Bible,Pencil                 │
│ 2020-06-02 │ 1        │ Mask                         │
└────────────┴──────────┴──────────────────────────────┘
*/

# Write your MySQL query statement below
SELECT sell_date, COUNT(DISTINCT product) as num_sold,
       GROUP_CONCAT(
            DISTINCT product
            ORDER BY product 
            SEPARATOR ','
       ) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;


/* Rule of thumb: 
CONCAT() --> combine columns/strings within one row.
GROUP_CONCAT() --> combine values from multiple rows into one string.
DISTINCT -> remove duplicates.
-- SEPARATOR -> specify the separator for GROUP_CONCAT, default is comma. 
the ORDER BY clause within GROUP_CONCAT is used to sort the values lexicographically before concatenation. */


-- ****** Alternative PostgreSQL solution using STRING_AGG  ****** :

-- Write your PostgreSQL query statement below

WITH DistinctProducts AS (
    SELECT DISTINCT sell_date, product
    FROM Activities
)

SELECT sell_date , COUNT(*) AS num_sold , 
       STRING_AGG(
        product , ','
        ORDER BY product
       ) AS products
FROM DistinctProducts
GROUP BY sell_date
ORDER BY sell_date;



-- STRING_AGG() is a PostgreSQL function that concatenates values from multiple rows into a single string, with an optional separator. 
--In this query, we first create a Common Table Expression (CTE) named DistinctProducts to select distinct combinations of sell_date and product. Then, we use STRING_AGG to concatenate the product names for each sell_date, ordering them lexicographically and separating them with commas.
