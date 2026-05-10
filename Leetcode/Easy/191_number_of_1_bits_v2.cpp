/*Problem link: https://leetcode.com/problems/number-of-1-bits/
Technique: Bit Manipulation
Logic: We only check the set bits instead of all 32 bits.
Subtracting 1 from a number flips the rightmost 1 bit to 0 and turns all bits to its right into 1. By performing a bitwise AND between the original number and the number after subtracting 1, 
we effectively remove the rightmost set bit. We repeat this process until the number becomes 0, counting how many times we can remove a set bit.

Time complexity: O(1), Space complexity: O(1) */

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int hammingWeight(int n) {
        int res = 0;
        while(n)
        {
            n = n & n - 1;               //remove the rightmost set bit
            res++;
        }
        return res;
    }
};

int main(){
    Solution sol;
    int n = 11;
    cout << sol.hammingWeight(n) << endl;          // Output: 3 (since 11 in binary is 1011 which has three set bits)
    return 0;
}