/* Problem link: https://leetcode.com/problems/contains-duplicate-ii/
Technique: Sliding Window with Hash Set
Time Complexity: O(n), Space Complexity: O(min(n, k))  */

#include <iostream>
#include <vector>
#include <unordered_set>
using namespace std;

class Solution {
   public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        int n = nums.size();
        unordered_set<int> hs;
        int l = 0, r = 0;

        while (r < n) {
            if (r - l > k) {          // Checking if the window size is less than or equal to k
                hs.erase(nums[l]);   // removing value nums[l] from the hashset
                l++;
            }

            if (hs.find(nums[r]) != hs.end()) {    // check if the value already is in the set
                return true;
            }
            hs.insert(nums[r]);          // add value to the hashset
            r++;
        }
        return false;
    }
};

int main() {
    Solution sol;
    vector<int> nums = {1, 2, 3, 1};
    int k = 3;
    cout << sol.containsNearbyDuplicate(nums, k) << endl; // Output: true
    return 0;
}