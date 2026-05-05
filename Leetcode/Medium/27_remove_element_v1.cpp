/* Problem link: https://leetcode.com/problems/remove-element/description/
Time complexity: O(n), Space complexity: O(1)
Two pointer approach
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int k=0, n = nums.size();
        for(int i=0; i<n; i++){  
            if(nums[i] != val){
                nums[k++] = nums[i]; 
            }
        }
        return k;
    }
};

int main()
{
    Solution sol;
    vector<int> nums = {3,2,2,3};
    int val = 3;
    int k = sol.removeElement(nums, val);
    cout << k << endl; // Output: 2
    for(int i=0; i<k; i++){
        cout << nums[i] << " "; // Output: 2 2
    }
    cout << endl;
}