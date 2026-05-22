/*Problem link: https://leetcode.com/problems/search-in-rotated-sorted-array/
Time Complexity: O(log n)      ***this is the main constraint of the problem, otherwise it would have been O(n)
Space Complexity: O(1)
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int search(vector<int>& nums, int target) {
        int l = 0, r = nums.size() - 1, mid;
        while(l <= r){
            mid = l + (r - l) / 2;
            if(nums[mid] == target) return mid;

            if(nums[mid] >= nums[l]){
                if(target >= nums[l] && target <= nums[mid]){
                    r = mid - 1;
                }
                else{
                    l = mid + 1;
                }
            }

            else{
                if(target >= nums[mid] && target <= nums[r]){
                    l = mid + 1;
                }
                else{
                    r = mid - 1;
                }
            }
        }
        return -1;
    }
};

int main(){
    Solution s;
    vector<int> nums = {4,5,6,7,0,1,2};
    int target = 0;
    cout << s.search(nums, target) << endl;     //output: 4
    return 0;
}