/*Problem: Find Minimum in Rotated Sorted Array II
Problem link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/ 
Technique: Binary Search with some modifications (Pivot finding) & handling duplicates
*Constraints: Problem has to be solved in O(log n) time complexity instead of O(n)
**Time Complexity: O(log n) , Space Complexity: O(1)
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public: 
    int findMin(vector<int>& nums) {
        int l = 0, r = nums.size() - 1, mid, res = INT_MAX;
        while(l <= r)
        {
            // Skip duplicates from the left
            while(l < r && nums[l] == nums[l+1]){
                l++;
            }
            // Skip duplicates from the right
            while(l < r && nums[r] == nums[r-1]){
                r--;
            }

            // If array is already sorted, then the minimum element is the leftmost element
            if(nums[r] > nums[l]){
                res = min(res, nums[l]);
            }

            mid = l + (r - l) / 2;
            res = min(res, nums[mid]);

            //If this condition is true, it means the left half is sorted, so the minimum element must be in the right half
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

int main(){
    Solution sol;
    vector<int> nums = {2, 2, 2, 0, 1};
    cout << sol.findMin(nums) << endl; // Output: 0
    return 0;
}