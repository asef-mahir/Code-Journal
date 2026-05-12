/* Problem link: https: leetcode.com/problems/power-of-two/description/

-- Bit Manipulation
-Powers of two look like 1, 10, 100, 1000......in binary
-Subtracting 1 looks like 0, 01, 011,  0111... ( 0 becomes 1, 1 becomes 0)
-They share zero bits in common (that's why binary and product becomes 0)
-Therefore, n & (n-1) is the world's fastest way to find a power of two.*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool isPowerOfTwo(int n) {
        if (n <= 0)
            return false;

        if ((n & n - 1) == 0)
            return true;
        else
            return false;
    }
};

int main()
{
    Solution ob;
    cout << ob.isPowerOfTwo(64);
}