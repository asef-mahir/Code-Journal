/*Problem link: https://leetcode.com/problems/find-users-with-valid-emails/ 
Statement: Write a solution to find the users who have valid emails. A valid email has:
- Prefix name: may contain letters (upper/lower case), digits, underscore '_', period '.', and/or dash '-'
- Prefix name must start with a letter
- Domain: '@leetcode.com' (exactly, case-sensitive)
Return the result table in any order.

Note:
- user_id is the primary key.
- Domain must be exactly '@leetcode.com' (lowercase, no other characters).

┌─────────────────────────────────────────────────────────────────────┐
│                              Users                                   │
├─────────────────┬───────────────────────────────────────────────────┤
│ user_id         │ int (Primary Key)                                 │
│ name            │ varchar                                           │
│ mail            │ varchar                                           │
└─────────────────┴───────────────────────────────────────────────────┘

Sample Data:
┌─────────┬───────────┬─────────────────────────┐
│ user_id │ name      │ mail                    │
├─────────┼───────────┼─────────────────────────┤
│ 1       │ Winston   │ winston@leetcode.com    │
│ 2       │ Jonathan  │ jonathanisgreat         │
│ 3       │ Annabelle │ bella-@leetcode.com     │
│ 4       │ Sally     │ sally.come@leetcode.com │
│ 5       │ Marwan    │ quarz#2020@leetcode.com │
│ 6       │ David     │ david69@gmail.com       │
│ 7       │ Shapiro   │ .shapo@leetcode.com     │
│ 8       │ Winston   │ winston@leetcode?com    │
│ 9       │ Winston   │ winston@leetcode.COM    │
└─────────┴───────────┴─────────────────────────┘

Note: user_id 8 and 9 are invalid (question mark in domain, uppercase COM respectively) and should NOT be included in output.

Sample Output:
┌─────────┬───────────┬─────────────────────────┐
│ user_id │ name      │ mail                    │
├─────────┼───────────┼─────────────────────────┤
│ 1       │ Winston   │ winston@leetcode.com    │
│ 3       │ Annabelle │ bella-@leetcode.com     │
│ 4       │ Sally     │ sally.come@leetcode.com │
└─────────┴───────────┴─────────────────────────┘
*/


-- *********** MySQL Solution ***********
# Write your MySQL query statement below
SELECT *
FROM Users
WHERE REGEXP_LIKE(
    mail, 
    '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$',
    'c'
)


-- Regex breakdown:
-- ^                    : start of string
-- [A-Za-z]             : first character is a letter
-- [A-Za-z0-9_.-]*      : allowed prefix characters (zero or more)
-- @leetcode\\.com      : exact domain
-- \\.                  : literal dot (.) in regex (escaped)
-- $                    : end of string
-- 'c' enables case-sensitive matching, so '@leetcode.COM' is invalid.



-- *********** PostgreSQL Solution *********** 
-- Write your PostgreSQL query statement below
SELECT *
FROM Users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$'


-- Regex breakdown:
-- ^                    : start of string
-- [A-Za-z]             : first character is a letter
-- [A-Za-z0-9_.-]*      : allowed prefix characters (zero or more)
-- @leetcode\.com       : exact domain (dot is escaped)
-- $                    : end of string
-- In PostgreSQL, the ~ operator performs case-sensitive regex matching, so '@leetcode.COM' is invalid.
-- in pgsql, the dot (.) is escaped with a single backslash (\) in the regex pattern. (in MySQL, \\.)

--  ~ : case-sensitive regex match ('abc' matches 'abc' but not 'ABC')
--  ~* : case-insensitive regex match ('abc' matches 'abc', 'ABC' , 'AbC', etc.)





-- ================= REGEX CHEAT SHEET =================
-- ^         : start of string
-- $         : end of string
-- .         : any single character
-- \.        : literal dot (.)
--
-- *         : 0 or more occurrences
-- +         : 1 or more occurrences
-- ?         : 0 or 1 occurrence
--
-- [abc]     : one of a, b, c
-- [A-Z]     : uppercase letter
-- [a-z]     : lowercase letter
-- [A-Za-z]  : any letter
-- [0-9]     : digit
-- [A-Za-z0-9] : alphanumeric character
--
-- [^0-9]    : not a digit
-- [^abc]    : any character except a, b, c
--
-- Examples:
-- ^abc$     : exactly "abc"
-- ^[0-9]+$  : one or more digits only
-- ^[A-Za-z][A-Za-z0-9_]*$
--           : starts with a letter, followed by letters/digits/_
--
-- MySQL:
-- REGEXP_LIKE(col, pattern, 'c')  -> case-sensitive
--
-- PostgreSQL:
-- col ~ pattern   -> case-sensitive regex match
-- col ~* pattern  -> case-insensitive regex match