/*Problem link: https://leetcode.com/problems/movie-rating/ 
Statement: Write a solution to:
1. Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
2. Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

Note:
- movie_id is the primary key in Movies table.
- user_id is the primary key in Users table.
- (movie_id, user_id) is the primary key in MovieRating table.
- created_at is the review date.

┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│               Movies                │     │               Users                 │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ movie_id        │ int (Primary Key) │     │ user_id         │ int (Primary Key) │
│ title           │ varchar           │     │ name            │ varchar (Unique)  │
└─────────────────┴───────────────────┘     └─────────────────┴───────────────────┘

┌─────────────────────────────────────────────────────────────────────┐
│                         MovieRating                                  │
├─────────────────┬───────────────────────────────────────────────────┤
│ movie_id        │ int (FK to Movies)                                │
│ user_id         │ int (FK to Users)                                 │
│ rating          │ int                                               │
│ created_at      │ date                                              │
└─────────────────┴───────────────────────────────────────────────────┘
Primary Key: (movie_id, user_id)

Sample Data - Movies:
┌──────────┬──────────┐
│ movie_id │ title    │
├──────────┼──────────┤
│ 1        │ Avengers │
│ 2        │ Frozen 2 │
│ 3        │ Joker    │
└──────────┴──────────┘

Sample Data - Users:
┌─────────┬─────────┐
│ user_id │ name    │
├─────────┼─────────┤
│ 1       │ Daniel  │
│ 2       │ Monica  │
│ 3       │ Maria   │
│ 4       │ James   │
└─────────┴─────────┘

Sample Data - MovieRating:
┌──────────┬─────────┬────────┬────────────┐
│ movie_id │ user_id │ rating │ created_at │
├──────────┼─────────┼────────┼────────────┤
│ 1        │ 1       │ 3      │ 2020-01-12 │
│ 1        │ 2       │ 4      │ 2020-02-11 │
│ 1        │ 3       │ 2      │ 2020-02-12 │
│ 1        │ 4       │ 1      │ 2020-01-01 │
│ 2        │ 1       │ 5      │ 2020-02-17 │
│ 2        │ 2       │ 2      │ 2020-02-01 │
│ 2        │ 3       │ 2      │ 2020-03-01 │
│ 3        │ 1       │ 3      │ 2020-02-22 │
│ 3        │ 2       │ 4      │ 2020-02-25 │
└──────────┴─────────┴────────┴────────────┘

Sample Output:
┌──────────┐
│ results  │
├──────────┤
│ Daniel   │
│ Frozen 2 │
└──────────┘
*/

# Write your MySQL query statement below
(
    SELECT u.name AS results
    FROM MovieRating mr JOIN Users u
    ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1
)

UNION ALL

(
    SELECT mv.title AS results
    FROM MovieRating as mr JOIN Movies as mv
    ON mr.movie_id = mv.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, mv.title
    ORDER BY AVG(mr.rating) DESC, mv.title
    LIMIT 1
);



-- Explanation:
-- This solution uses two independent subqueries combined using UNION ALL.

-- PART 1: Finds the user who has rated the most movies.
-- GROUP BY runs only on user_id; name is included only because it is selected, not as a grouping key.
-- ORDER BY COUNT(*) DESC picks the most active user; name is used for lexicographical tie-break.

-- PART 2: Finds the highest-rated movie in February 2020 only.
-- GROUP BY runs only on movie_id; title is included only because it is selected, not as a grouping key.
-- The date filter uses BETWEEN, which is inclusive of both start and end dates.
-- used 2020-02-29 as the end date to cover all of February, including leap years.
-- ORDER BY AVG(rating) DESC ranks movies by quality, with title as tie-breaker.

-- UNION ALL simply stacks the two results without removing duplicates, since each query returns a single final row.