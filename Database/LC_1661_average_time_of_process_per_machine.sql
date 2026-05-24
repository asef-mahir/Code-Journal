/*Problem link: https://leetcode.com/problems/average-time-of-process-per-machine/
Statement: Write a solution to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp.
The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, rounded to 3 decimal places.
Return the result table in any order.

Note: (machine_id, process_id, activity_type) is the primary key.
activity_type is an ENUM of ('start', 'end').
'start' timestamp will always be before 'end' timestamp for every (machine_id, process_id) pair.
Each (machine_id, process_id) pair has exactly one 'start' and one 'end' timestamp.

┌─────────────────────────────────────────────────────┐
│                    Activity                         │
├─────────────────┬───────────────────────────────────┤
│ machine_id      │ int                               │
│ process_id      │ int                               │
│ activity_type   │ enum ('start', 'end')             │
│ timestamp       │ float                             │
└─────────────────┴───────────────────────────────────┘
Primary Key: (machine_id, process_id, activity_type)

Sample Data:
┌────────────┬────────────┬───────────────┬───────────┐
│ machine_id │ process_id │ activity_type │ timestamp │
├────────────┼────────────┼───────────────┼───────────┤
│ 0          │ 0          │ start         │ 0.712     │
│ 0          │ 0          │ end           │ 1.520     │
│ 0          │ 1          │ start         │ 3.140     │
│ 0          │ 1          │ end           │ 4.120     │
│ 1          │ 0          │ start         │ 0.550     │
│ 1          │ 0          │ end           │ 1.550     │
│ 1          │ 1          │ start         │ 0.430     │
│ 1          │ 1          │ end           │ 1.420     │
│ 2          │ 0          │ start         │ 4.100     │
│ 2          │ 0          │ end           │ 4.512     │
│ 2          │ 1          │ start         │ 2.500     │
│ 2          │ 1          │ end           │ 5.000     │
└────────────┴────────────┴───────────────┴───────────┘

Sample Output:
┌────────────┬─────────────────┐
│ machine_id │ processing_time │
├────────────┼─────────────────┤
│ 0          │ 0.894           │
│ 1          │ 0.995           │
│ 2          │ 1.456           │
└────────────┴─────────────────┘
*/

# Write your MySQL query statement below
SELECT a.machine_id, 
       ROUND(AVG(b.timestamp - a.timestamp),3) AS processing_time
FROM Activity a JOIN Activity b
ON a.machine_id = b.machine_id AND a.process_id = b.process_id
WHERE a.activity_type = 'start' AND b.activity_type = 'end'
GROUP BY machine_id;


--ROUND(x,3) means to round the value of x to 3 decimal places. Given in problem statement.