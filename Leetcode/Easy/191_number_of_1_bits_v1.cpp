/*Problem link: https://leetcode.com/problems/number-of-1-bits/ 
Technique: Bit Manipulation
Logic: Iterate through each bit and check if it is set bit (iterates 32 times) 
Time complexity: O(1) (since it iterates 32 times which is constant) */

#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
    int hammingWeight(int n) {
        int res = 0;
        for(int i = 0; i < 31; i++){
            if((1 << i) & n){                  //check if the i-th bit is set bit
                res++;
            }
        }
        return res;
    }
};

int main(){
    Solution sol;
    int n = 11;
    cout << sol.hammingWeight(n) << endl;             // Output: 3 (since 11 in binary is 1011 which has three set bits)
    return 0;
}