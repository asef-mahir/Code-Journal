/* Problem link: https://leetcode.com/problems/longest-substring-without-repeating-characters/ 
Technique: Sliding Window 
Time Complexity: O(n)
Space Complexity: O(min(m,n)) where m is the size of the character set */

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int l = 0, r = 0, len = 0;
        unordered_set <int> hs;     

        while(r < s.length())
        {
            if(hs.find(s[r]) == hs.end()){      // if the character is not in the hashset, insert it and move the right pointer
                hs.insert(s[r]);
                r++;
                len = max(len, r - l);        // window length/ hashset length = r - l (after r increment ofc)
            }
            else{
                hs.erase(s[l]);          // if the character is in the hashset, remove the leftmost character and move the left pointer
                l++;
            }
        }
        return len;
    }
};

int main()
{
    Solution s;
    string str = "abcabcbb";
    cout << s.lengthOfLongestSubstring(str) << endl; // 3
    return 0;
}