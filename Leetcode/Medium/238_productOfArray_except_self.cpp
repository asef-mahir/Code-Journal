/*Problem link: https://leetcode.com/problems/product-of-array-except-self/
Technique - Optimal suffix and prefix
Time complexity: O(n)
Space complexity: O(1) for extra space, O(n) space for output array
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int n = nums.size();
        vector<int> res(n,1);
        //for Prefix
        for(int i=1; i<n; i++){
            res[i] = nums[i-1] * res[i-1];
        }
       //for Postfix
       int postfix = 1;
        for(int i= n-1; i>=0; i--){
            res[i] = res[i] * postfix;
            postfix = postfix * nums[i];      
        }

        return res;
    }
};

int main(){
    Solution sol;
    vector<int> vc = {1,2,3,4};
    vector<int> res = sol.productExceptSelf(vc);
    for(int x : res){
        cout << x << " ";
    }
}