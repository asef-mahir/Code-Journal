/*Problem link: https://www.hackerrank.com/challenges/the-pads/problem
Statement: Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

**Note: There will be at least two entries in the table for each type of occupation.

Input Format

The OCCUPATIONS table is described as follows:
┌─────────────────────────────────────┐
│            OCCUPATIONS              │
├─────────────────┬───────────────────┤
│ Name            │ String            │
│ Occupation      │ String            │
└─────────────────┴───────────────────┘

Sample Data:
┌────────────┬────────────┐
│ Name       │ Occupation │
├────────────┼────────────┤
│ Samantha   │ Doctor     │
│ Julia      │ Actor      │
│ Maria      │ Actor      │
│ Meera      │ Singer     │
│ Ashely     │ Professor  │
│ Ketty      │ Professor  │
│ Christeen  │ Professor  │
│ Jane       │ Actor      │
│ Jenny      │ Doctor     │
│ Priya      │ Singer     │
└────────────┴────────────┘

Sample Output:
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors. */

SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT(
    'There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.'
)
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;


--For first query, we use CONCAT to concatenate the name with the first letter of the occupation in parentheses. We use LEFT to get the first letter of the occupation. We order the results by name.
--CONCAT() joins multiple strings together.
--LEFT(string, n) means: Taking the leftmost n characters from the string.

--For the second query, we count the number of occurrences of each occupation using COUNT(*), and group the results by occupation. We order the results first by the count and then alphabetically by occupation. We use LOWER to convert the occupation name to lowercase in the output string.
--COUNT(*): Counts the number of rows in each group defined by GROUP BY.
--GROUP BY: This allows us to perform aggregate functions like COUNT on each group of occupations.
--ORDER BY: We first sort by the count of occurrences (ascending) and then by occupation name (alphabetically) when there are ties in the count.
--LOWER(string): Converts the string to lowercase.