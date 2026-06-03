/*Problem link: https://leetcode.com/problems/triangle-judgement/
Statement: Report for every three line segments whether they can form a triangle. Return the result table in any order.

Note:
- (x, y, z) is the primary key.
- Triangle inequality theorem: sum of any two sides must be greater than the third side.

┌─────────────────────────────────────┐
│             Triangle                │
├─────────────────┬───────────────────┤
│ x               │ int               │
│ y               │ int               │
│ z               │ int               │
└─────────────────┴───────────────────┘
Primary Key: (x, y, z)

Sample Data:
┌────┬────┬────┐
│ x  │ y  │ z  │
├────┼────┼────┤
│ 13 │ 15 │ 30 │
│ 10 │ 20 │ 15 │
└────┴────┴────┘

Sample Output:
┌────┬────┬────┬──────────┐
│ x  │ y  │ z  │ triangle │
├────┼────┼────┼──────────┤
│ 13 │ 15 │ 30 │ No       │
│ 10 │ 20 │ 15 │ Yes      │
└────┴────┴────┴──────────┘
*/

# Write your MySQL query statement below
SELECT x,y,z, (CASE WHEN x+y > z AND x+z > y AND y+z > x THEN 'Yes' ELSE 'No' END) AS triangle
FROM Triangle;