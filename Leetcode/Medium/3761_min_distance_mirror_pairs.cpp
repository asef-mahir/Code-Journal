/* Problem Link: https://leetcode.com/problems/minimum-distance-between-mirror-pairs/description/
Technique: Hash Map, String Manipulation, used Lambda function for reversing digits
Time Complexity: O(n * log(m)) where n is the number of elements in the input array and m is the maximum number of digits in any element (due to the reversal operation).
// Notes: Uses unordered_map::count, which is available in C++11+. For C++20, you can use hm.contains(x) instead.
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int minMirrorPairDistance(vector<int>& nums) {
        int d = INT_MAX;
        unordered_map<int, int> hm;
        // Lambda Function for reversing digits
        auto rev = [](int x) {            
            int rem, y = 0;
            while (x != 0) {
                rem = x % 10;
                y = y * 10 + rem;
                x = x / 10;
            }
            return y;
        };

        for (int i = 0; i < nums.size(); i++) {
            int x = nums[i];
            if (hm.count(x) > 0){     //check if x is already in the hash map, for c++20, you can use hm.contains(x) instead of hm.count(x) > 0
                d = min(d, i - hm[x]);
            }
            hm[rev(x)] = i;       // Store the reversed number and its index (key,value) = (reverse of x, index of x)
        }

        return d == INT_MAX ? -1 : d;
    }
};

int main() {
    Solution sol;
    vector<int> nums = {12,21,45,33,54};
    cout << sol.minMirrorPairDistance(nums) << endl; // Output: 1
    return 0;
}