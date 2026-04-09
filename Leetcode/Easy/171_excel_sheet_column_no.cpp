/* Problem link: https://leetcode.com/problems/excel-sheet-column-number/description/
*** BRAIN TEASER ***
Time complexity: O(n), Space complexity: O(1)
*/

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int titleToNumber(string columnTitle) {
        int len = columnTitle.length();
        long long res = 0;

        for(char & x : columnTitle){
            int d = x - 'A' + 1;
            // Shift existing result by base 26 and add the current digit
            // This follows the polynomial expansion: res = d1*26^(n-1) + d2*26^(n-2)...
            res = res * 26 + d;
        } 

        return res;
    }
};

int main()
{
    Solution sol;
    cout << sol.titleToNumber("BC");
}

/*
   CORE LOGIC: Base-26 Conversion (Similar to Decimal)
   In Decimal (Base-10), "123" is: (1 * 10^2) + (2 * 10^1) + (3 * 10^0)
   Or more simply: ((1 * 10) + 2) * 10 + 3
   
   Excel columns work the same way but with Base-26 ('A'=1, 'B'=2... 'Z'=26):
   Example "BC":
   1. Start with 0.
   2. See 'B' (2): res = (0 * 26) + 2 = 2
   3. See 'C' (3): res = (2 * 26) + 3 = 55
   
   This effectively "shifts" the previous digits to the left to make room 
   for the new character, just like adding a digit to the end of a number.
*/