/*Problem link: https://leetcode.com/problems/search-a-2d-matrix/
Technique: Binary search on 2D matrix
Space Complexity: O(1)
Time Complexity: O(log m + log n) / O(log (m*n))    //both are same
-time complexity is optimized, otherwise it would have been O(n*n)
*/

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int m = matrix.size();
        int n = matrix[0].size();

        int x=0, y=m-1, mi;
        while(x <= y)
        {
            mi = x + (y-x)/2;
            if(target >= matrix[mi][0] && target <= matrix[mi][n-1]){
                break;
            }
            else if(target > matrix[mi][0]){
                x = mi + 1;
            }
            else{
                y = mi - 1;
            }
        }

        int l = 0, h = n-1, mid;
        while(l <= h)
        {
            mid = l + (h-l)/2;
            if(target == matrix[mi][mid]){
                return true;
            }
            else if(target > matrix[mi][mid]){
                l = mid + 1;
            }
            else{
                h = mid - 1;
            }
        }
        return false;
    }
};

int main(){
    vector<vector<int>> vc = {{1,3,5,7}, {10,11,16,20}, {23,30,34,60}};
    Solution ob;
    cout << ob.searchMatrix(vc, 3);
}