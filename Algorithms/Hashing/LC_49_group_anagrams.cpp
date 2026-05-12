/* Problem link: https://leetcode.com/problems/group-anagrams/description/
Time complexity: O(m * n (log n)) , Space complexity: O(m * n)
where, m = size of the string, n = length of the longest string
-Technique: Sorting and Hashmap.
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        unordered_map <string, vector<string>> vc;
        for(const auto &s : strs)
        {
            string st = s;
            sort(st.begin(), st.end());
            //vector's key is the sorted string
            //Putting the original string in the vector as value
            vc[st].push_back(s);
        }

        vector<vector<string>> res;
        for(const auto & pair : vc)
        {
            res.push_back(pair.second);
        }

        return res;
    }
};

int main()
{
    Solution obj;
    vector <string> strs = {"eat","tea","tan","ate","nat","bat"};
    vector<vector<string>> res = obj.groupAnagrams(strs);
    for(auto & x : res){
        cout << "[" ;
        for(auto & y : x){
            cout << y << " ";
        }
        cout << "]";
    }
}