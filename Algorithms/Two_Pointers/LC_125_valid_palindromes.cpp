// Problem link: https://leetcode.com/problems/valid-palindrome/description/
// Technique: Two-pointer
// Time complexity:O(n), Space complexity: O(1)
#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool isPalindrome(string s) {
        int l = 0, r = s.length() - 1;
        while (l < r) {
            // Skip non-alphanumeric characters from the left
            if (! isalnum(s[l])) {
                l++;
            // Skip non-alphanumeric characters from the right
            } else if (! isalnum(s[r])) {
                r--;
            } else {
                if (tolower(s[l]) != tolower(s[r])) {
                    return false;
                }

                 l++;
                 r--;
            }
        }

        return true;
    }
};

int main()
{
    Solution sol;
    cout << sol.isPalindrome("A man, a plan, a canal: Panama");
}