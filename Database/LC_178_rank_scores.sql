/*Problem link: https://leetcode.com/problems/rank-scores/
Technique: Window Functions
Statement:  Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
- The scores should be ranked from the highest to the lowest.
- If there is a tie between two scores, both should have the same ranking.
- After a tie, the next ranking number should be the next consecutive integer value (no holes between ranks).
- Return the result table ordered by score in descending order.

┌─────────────────────────────────────┐
│              Scores                 │
├─────────────────┬───────────────────┤
│ id              │ int (Primary Key) │
│ score           │ decimal(3,2)      │
└─────────────────┴───────────────────┘

Sample Data:
┌────┬───────┐
│ id │ score │
├────┼───────┤
│ 1  │ 3.50  │
│ 2  │ 3.65  │
│ 3  │ 4.00  │
│ 4  │ 3.85  │
│ 5  │ 4.00  │
│ 6  │ 3.65  │
└────┴───────┘

Sample Output:
┌───────┬──────┐
│ score │ rank │
├───────┼──────┤
│ 4.00  │ 1    │
│ 4.00  │ 1    │
│ 3.85  │ 2    │
│ 3.65  │ 3    │
│ 3.65  │ 3    │
│ 3.50  │ 4    │
└───────┴──────┘
*/

SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores;

/* DENSE_RANK() is a window function to calculate the rank of each score. It assigns the same rank to tied scores and does not leave gaps in the ranking sequence. 
The ORDER BY clause within the OVER() function specifies that the ranking should be based on the score in descending order. 
OVER() indicates that the ranking should be calculated for each row in the result set.
**Note: Used 'rank' as alias instead of just rank bcz rank is a reserved keyword in SQL.
*/