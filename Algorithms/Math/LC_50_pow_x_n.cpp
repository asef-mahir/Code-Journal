/*
 * Problem: Pow(x, n) — LeetCode 50
 * Link: https://leetcode.com/problems/powx-n/
 *
 * CORE IDEA (read this first):
 *   Instead of multiplying x by itself n times (slow),
 *   we exploit the fact that any number can be broken into powers of 2.
 *
 *   Example: x^13 = x^8 × x^4 × x^1   (bcz 13 = 8 + 4 + 1)
 *
 *   We generate x^1, x^2, x^4, x^8... by repeatedly squaring x.
 *   We use the binary bits of n to decide which of those to multiply in.
 *   A bit = 1 → include it. A bit = 0 → skip it.
 *
 *** Technique:  Fast Exponentiation (Exponentiation by Squaring)
 *** Time:       O(log n) 
 *** Space:      O(1)
 * Naive would be O(n) — TLE for large n
 */
#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    double myPow(double x, int n) {
        if(n == 0) return 1;
        if(x == 0) return 0;

        long long power = abs((long long) n);

        double res = 1;
        while(power)
        {
            if(power & 1){                // If power is odd
                res = res * x;            // Multiply the current x to the result
            }
            x = x * x;                    // Square x for the next iteration  
            power = power >> 1;           // Right shift to divide power by 2
        }
        return n >= 0 ? res : 1/res;
    }
};

int main()
{
    Solution sol;
    double x = 2.00000;
    int n = 10;
    cout << sol.myPow(x, n) << endl; // Output: 1024.00000
    return 0;
}