/*Problem link: https://leetcode.com/problems/restaurant-growth/ 
Statement: Compute the moving average of how much the customer paid in a seven days window (current day + 6 days before). average_amount rounded to two decimal places. Return result ordered by visited_on ascending.There will be at least one customer every day.

Note:
- (customer_id, visited_on) is the primary key.
- Moving average: sum of amounts for current day and previous 6 days, divided by 7.

┌─────────────────────────────────────────────────────────────────────┐
│                            Customer                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ customer_id     │ int                                               │
│ name            │ varchar                                           │
│ visited_on      │ date                                              │
│ amount          │ int                                               │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (customer_id, visited_on)

Sample Data:
┌─────────────┬──────────┬────────────┬────────┐
│ customer_id │ name     │ visited_on │ amount │
├─────────────┼──────────┼────────────┼────────┤
│ 1           │ Jhon     │ 2019-01-01 │ 100    │
│ 2           │ Daniel   │ 2019-01-02 │ 110    │
│ 3           │ Jade     │ 2019-01-03 │ 120    │
│ 4           │ Khaled   │ 2019-01-04 │ 130    │
│ 5           │ Winston  │ 2019-01-05 │ 110    │
│ 6           │ Elvis    │ 2019-01-06 │ 140    │
│ 7           │ Anna     │ 2019-01-07 │ 150    │
│ 8           │ Maria    │ 2019-01-08 │ 80     │
│ 9           │ Jaze     │ 2019-01-09 │ 110    │
│ 1           │ Jhon     │ 2019-01-10 │ 130    │
│ 3           │ Jade     │ 2019-01-10 │ 150    │
└─────────────┴──────────┴────────────┴────────┘

Sample Output:
┌────────────┬────────┬────────────────┐
│ visited_on │ amount │ average_amount │
├────────────┼────────┼────────────────┤
│ 2019-01-07 │ 860    │ 122.86         │
│ 2019-01-08 │ 840    │ 120.00         │
│ 2019-01-09 │ 840    │ 120.00         │
│ 2019-01-10 │ 1000   │ 142.86         │
└────────────┴────────┴────────────────┘
*/

# Write your MySQL query statement below
WITH Daily AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),

WINDOWED AS (
        SELECT visited_on, 

        SUM(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,

        ROUND(AVG(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) ,2) AS average_amount,

        COUNT(*) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS cnt

        FROM Daily
)

SELECT visited_on, amount, average_amount 
FROM Windowed
WHERE cnt = 7
ORDER BY visited_on;


/* Explanation:
 1. We first create a Common Table Expression (CTE) named "Daily" to calculate the total amount spent by customers for each day by grouping the data based on the "visited_on" date.
 2. Next, we create another CTE named "WINDOWED" to calculate the moving average and total amount for each day using window functions. We use the SUM and AVG functions with a window frame of 7 days (current day + 6 preceding days) to compute the total amount and average amount for each day. We also count the number of days in the window using COUNT(*).
 3. Finally, we select the "visited_on", "amount", and "average_amount" columns from the "WINDOWED" CTE, filtering the results to include only those rows where the count of days in the window is 7 (ensuring we have a full 7-day window). We order the results by "visited_on" in ascending order.

-- WITH (CTE SYNTAX)
------------------
WITH A AS (...),           [A = Daily (clean daily totals)]
     B AS (...)            [B = Windowed (7-day calculations)]
SELECT ...

-- COUNT(*) OVER(...)        → ensures full 7-day window exists
-- windowed temporary table formation:
Windowed AS (
    SELECT visited_on,
        SUM(amount) OVER(...) AS amount,
        AVG(amount) OVER(...) AS average_amount,
        COUNT(*) OVER(...) AS cnt
    FROM Daily
)
Techniques Used: CTE (WITH clause) + Window Functions (OVER())
*/