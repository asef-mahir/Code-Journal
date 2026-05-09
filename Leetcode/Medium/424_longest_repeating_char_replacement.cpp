/*Problem link: https://leetcode.com/problems/longest-repeating-character-replacement/
-Technique: Sliding Window with HashMap
-Logic: We use a sliding window approach to find the longest substring with at most k replacements. We keep track of the maximum frequency 
of any character in the current window. If the window size minus the maximum frequency (which means number of replacement needed) is less than or equal to k,
we update the result. Otherwise, we shrink the window from the left. 
-Time Complexity: O(n), Space Complexity: O(1) */

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int characterReplacement(string s, int k) {
        int l = 0, r = 0, maxF = 0, res = 0;
        unordered_map <char, int> hm;
        while(r < s.length())
        {
            hm[s[r]]++;
            maxF = max(maxF, hm[s[r]]);
            r++;
            if(r - l - maxF <= k){
                res = max(res, r - l);
            }
            else{
                hm[s[l]]--;
                l++;
            }
        }
        return res;
    }
};

int main(){
    Solution sol;
    string s = "AABABBA";
    int k = 1;
    cout << sol.characterReplacement(s, k) << endl; // Output: 4
    return 0;
}