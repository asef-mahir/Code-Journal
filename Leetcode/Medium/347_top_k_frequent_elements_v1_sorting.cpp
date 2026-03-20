/* Problem link: https://leetcode.com/problems/top-k-frequent-elements/description/
-Technique: Sorting
-Time complexity: O(n log n),  Space complexity: O(n)
*/
#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int, int> hmap;
        for (const int & x : nums) {
            hmap[x]++;
        }

        // Storing (key/element, value/frequency) pair in a vector
        vector<pair<int, int>> vt;
        for (const auto & p : hmap) {
            // taking frequency first cz we'll sort through frequency
            //being stored in the vector as (frequency, element)
            vt.push_back({p.second, p.first});
        }

        // Sorting in Reverse (rbegin(), rend())... In decreasing order for  frequency 
        sort(vt.rbegin(), vt.rend());

        // Now print the elements of top frequency
        vector<int> res;
        for (int i = 0; i < k; i++) {
            res.push_back(vt[i].second);
        }

        return res;
    }
};

int main()
{
    Solution sol;
    vector<int> vec = {1,1,1,2,2,3};
    vector<int> res = sol.topKFrequent(vec, 2);
    for(int x : res){
        cout << x << " ";
    }
}