/* Problem link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/ 
Technique: Two Pointers 
Time Complexity: O(n),  Space Complexity: O(1)     */

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int l = 0, r = 1, maxP = 0;
        while(r < prices.size())
        {
            if(prices[r] > prices[l])
            {
                int profit = prices[r] - prices[l];
                maxP =  max(maxP, profit);
            }
            else{
                l = r;
            }
            r++ ;
        }
        return maxP;
    }
};

int main()
{
    Solution s;
    vector<int> prices = {7,1,5,3,6,4};
    cout << s.maxProfit(prices) << endl;
    return 0;
}