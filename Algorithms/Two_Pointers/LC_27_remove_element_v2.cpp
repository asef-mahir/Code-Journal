/* Problem link: https://leetcode.com/problems/remove-element/description/
Time complexity: O(n), Space complexity: O(1)
Two pointer approach - optimized by swapping the element to be removed with the last element and reducing the array size, thus minimizing unnecessary copying of elements.
*/

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int i = 0, n = nums.size();
        while (i < n) {
            if (nums[i] == val) {
                nums[i] = nums[n - 1];
                n--;
            } else {
                i++;
            }
        }
        return n;
    }
};

int main()
{
    Solution sol;
    vector<int> nums = {3, 2, 2, 3};
    int val = 3;
    int k = sol.removeElement(nums, val);
    cout << k << endl; // Output: 2
    for (int i = 0; i < k; i++)
    {
        cout << nums[i] << " "; // Output: 2 2
    }
    cout << endl;
}