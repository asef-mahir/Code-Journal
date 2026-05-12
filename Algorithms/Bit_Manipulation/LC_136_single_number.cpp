/*Problem link: https://leetcode.com/problems/single-number/
Technique: XOR (Bit Manipulation)
Time Complexity: O(n), Space Complexity: O(1) */

#include<bits/stdc++.h>
using namespace std;
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int d = 0;
        for(int x : nums)
        {
            d = x ^ d;                    // A ^ A = 0 and A ^ 0 = A......A ^ B ^ A = B
        }
        return d;
    }
};

int main()
{
    Solution s;
    vector<int> nums = {2,2,1};
    cout << s.singleNumber(nums) << endl;
    return 0;
}