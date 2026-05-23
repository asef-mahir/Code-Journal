/*Problem link: https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/ 
Technique: Count the number of decreasing transitions in the array
Time Complexity: O(n)
Space Complexity: O(1)
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool check(vector<int>& nums) {
        int n = nums.size();
        int cnt = 0;

        for(int i=0; i<n-1; i++){
            if(nums[i+1] < nums[i]) cnt++;
            if(cnt > 1) return false;
        }

        if(nums[n-1] > nums[0]) cnt++;

        return cnt <= 1? true : false;
    }
};

int main(){
    Solution sol;
    vector<int> nums = {3,4,5,1,2};
    cout << sol.check(nums) << endl;      // Output: true
    return 0;
}