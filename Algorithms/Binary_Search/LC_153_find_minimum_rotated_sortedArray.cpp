/*Problem: Find Minimum in Rotated Sorted Array
Problem link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
Technique: Binary Search with some modifications (Pivot finding)
*Constraints: Problem has to be solved in O(log n) time complexity, so we cannot do linear search, we have to use binary search
**Time Complexity: O(log n) , Space Complexity: O(1)
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int findMin(vector<int> &nums) {
        int l = 0, r = nums.size() - 1, mid, res = INT_MAX;
        while(l <= r)
        {
            if(nums[r] > nums[l]){
                res = min(res, nums[l]);
                break;
            }
            mid = l + (r - l) / 2;
            res = min(res, nums[mid]);
            if(nums[mid] >= nums[l]){
                l = mid + 1;
            }
            else{
                r = mid - 1;
            }
        }
        return res;
    }
};

int main()
{
    Solution s;
    vector<int> nums = {3,4,5,1,2};
    cout << s.findMin(nums) << endl;
    return 0;
}