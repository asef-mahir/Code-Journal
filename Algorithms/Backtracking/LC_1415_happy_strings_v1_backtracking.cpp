//Time complexity: O(2^n)
//Space complexity: O(2^n)
/*Problem link: https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n/description/
//approach: backtracking/dfs (see leetcode editorial for better understanding)
*/

#include<bits/stdc++.h>
using namespace std;
class Solution {
public:
    string getHappyString(int n, int k) {
        string currString = "";
        vector<string> happyString;
        generateHappyString(n, currString, happyString);

        if (k > happyString.size())
            return "";        // return empty string
        return happyString[k - 1];
    }

private:
    void generateHappyString(int n, string currString,
                             vector<string>& happyString) 
        {
        if (currString.length() == n) {
            happyString.push_back(currString);
            return;
        }

        for (char ch = 'a'; ch <= 'c'; ch++) 
        {
            if(currString.length() > 0 && currString.back() == ch){
                continue;
            }

            generateHappyString(n,  currString + ch, happyString);
        }
    }
};

int main()
{
    Solution obj;
    
    cout << obj.getHappyString(3,9) <<endl;
}