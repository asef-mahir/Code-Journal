/*Problem link: https://leetcode.com/problems/immediate-food-delivery-ii/
Statement: Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

Note:
- delivery_id is the primary key.
- If order_date = customer_pref_delivery_date, order is immediate; otherwise scheduled.
- First order = earliest order_date per customer. Each customer has exactly one first order.

┌─────────────────────────────────────────────────────────────────────┐
│                            Delivery                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ delivery_id     │ int (Primary Key)                                 │
│ customer_id     │ int                                               │
│ order_date      │ date                                              │
│ customer_pref_delivery_date │ date                                  │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────────────┬─────────────┬────────────┬─────────────────────────────┐
│ delivery_id │ customer_id │ order_date │ customer_pref_delivery_date │
├─────────────┼─────────────┼────────────┼─────────────────────────────┤
│ 1           │ 1           │ 2019-08-01 │ 2019-08-02                  │
│ 2           │ 2           │ 2019-08-02 │ 2019-08-02                  │
│ 3           │ 1           │ 2019-08-11 │ 2019-08-12                  │
│ 4           │ 3           │ 2019-08-24 │ 2019-08-24                  │
│ 5           │ 3           │ 2019-08-21 │ 2019-08-22                  │
│ 6           │ 2           │ 2019-08-11 │ 2019-08-13                  │
│ 7           │ 4           │ 2019-08-09 │ 2019-08-09                  │
└─────────────┴─────────────┴────────────┴─────────────────────────────┘

Sample Output:
┌──────────────────────┐
│ immediate_percentage │
├──────────────────────┤
│ 50.00                │
└──────────────────────┘
Explanation: 
The customer id 1 has a first order with delivery id 1 and it is scheduled.
The customer id 2 has a first order with delivery id 2 and it is immediate.
The customer id 3 has a first order with delivery id 5 and it is scheduled.
The customer id 4 has a first order with delivery id 7 and it is immediate.
Hence, half the customers have immediate first orders.
*/

# Write your MySQL query statement below
SELECT ROUND(AVG(order_date = customer_pref_delivery_date) * 100,2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN
(
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);


-- Find each customer's first order using MIN(order_date).
-- Keep only those first-order records from the Delivery table.
-- order_date = customer_pref_delivery_date evaluates to 1 (true) or 0 (false).
-- Average these values and multiply by 100 to get the immediate delivery percentage.