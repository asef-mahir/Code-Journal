/* Problem link: https://leetcode.com/problems/count-submatrices-with-top-left-element-and-sum-less-than-k/description/
- 2D Prefix Sum Technique 
Time complexity: O(mn), Space complexity: O(n);   */

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int countSubmatrices(vector<vector<int>>& grid, int k) {
        int n = grid.size();
        int m = grid[0].size();
        vector<int> colSum(m);
        int cnt = 0;

        for(int i=0; i<n; i++)
        {
            int rowSum = 0;
                for(int j=0; j<m; j++)
                {
                    colSum[j] += grid[i][j];      // Accumulate vertical sum
                    rowSum += colSum[j];          // Accumulate total submatrix sum
                    if(rowSum <= k){
                        cnt++ ;
                    }
                }
        }

        return cnt;
    }
};

int main()
{
    Solution cls;
    vector<vector<int>> vc = {{7, 2, 9}, {1, 5, 0}, {2, 6, 6}};
    cout << cls.countSubmatrices(vc, 20);
}