/* Problem link: https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/description/
* Checks if 'mat' can be rotated 90, 180, or 270 degrees clockwise to match 'target'.
* Time Complexity: O(n^2), Space Complexity: O(n^2)
*/
#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool findRotation(vector<vector<int>>& mat, vector<vector<int>>& target) {
        int m = mat.size();
        int n = mat[0].size();

        if (mat == target) return true;

        // Create a copy to perform rotations without corrupting the original mid-loop
        vector<vector<int>> tmp = mat;

        // Try up to 3 more rotations (90, 180, and 270 degrees)
        for (int cnt = 1; cnt <= 3; cnt++)
         {
            for (int i = 0; i < m; i++) 
            {
                for (int j = 0; j < n; j++)
                {
                    // Applying the clockwise rotational formula
                    tmp[j] [n - (i + 1)] = mat[i][j];
                }
            }

            // Update 'mat' with the newly rotated values.
            // This allows the next iteration to rotate the matrix another 90 degrees.
            mat = tmp;

            if(mat == target)
                return true;
        }

        return false;
    }
};

int main()
{
    vector<vector<int>> mat = {{0,1},{1,0}};
    vector<vector<int>> target = {{1,0},{0,1}};
    Solution ob;
    bool r = ob.findRotation(mat, target);
    cout << r <<endl;
}