/*Problem link: https://leetcode.com/problems/investments-in-2016/
Statement: Write a solution to report the sum of all total investment values in 2016 (tiv_2016) for policyholders who:
1. Have the same tiv_2015 value as one or more other policyholders, and
2. Are not located in the same city as any other policyholder (i.e., (lat, lon) pairs must be unique).
Round tiv_2016 to two decimal places.

Note:
- pid is the primary key.
- lat and lon are never NULL.

┌─────────────────────────────────────────────────────────────────────┐
│                            Insurance                                │
├─────────────────┬───────────────────────────────────────────────────┤
│ pid             │ int (Primary Key)                                 │
│ tiv_2015        │ float                                             │
│ tiv_2016        │ float                                             │
│ lat             │ float (not NULL)                                  │
│ lon             │ float (not NULL)                                  │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────┬──────────┬──────────┬─────┬─────┐
│ pid │ tiv_2015 │ tiv_2016 │ lat │ lon │
├─────┼──────────┼──────────┼─────┼─────┤
│ 1   │ 10       │ 5        │ 10  │ 10  │
│ 2   │ 20       │ 20       │ 20  │ 20  │
│ 3   │ 10       │ 30       │ 20  │ 20  │
│ 4   │ 10       │ 40       │ 40  │ 40  │
└─────┴──────────┴──────────┴─────┴─────┘

Sample Output:
┌──────────┐
│ tiv_2016 │
├──────────┤
│ 45.00    │
└──────────┘
*/

# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND
    (lat,lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)


--Explanation:
--1. The inner subquery selects tiv_2015 values that appear more than once, ensuring that we only consider policyholders with duplicate tiv_2015 values.
--2. The second subquery selects unique (lat, lon) pairs, ensuring that we only consider policyholders located in unique cities.
--3. The main query then sums the tiv_2016 values for policyholders that meet both criteria and rounds the result to two decimal places.
-- *** GROUP BY lat, lon is composite grouping, which allows us to group by both latitude and longitude together. (lat, lon) is treated as a single entity for grouping purposes.