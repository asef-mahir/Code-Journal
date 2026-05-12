/* * Problem Link: https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/
 * Description: Determines if a matrix can match a target by rotating it 90-degree increments.
 * * Approach: In-place Rotation (Transpose then Reverse)
 * - Transposing: Swapping elements across the main diagonal (mat[i][j] <-> mat[j][i]).
 * - Reversing: Flipping each row horizontally to complete a 90-degree clockwise rotation.
 *** Time Complexity: O(n^2) - We iterate through the matrix up to 4 times.
 *** Space Complexity: O(1) - No extra matrices are created; we modify 'mat' in place.
 */

#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool findRotation(vector<vector<int>>& mat, vector<vector<int>>& target) {
        int n = mat.size();
        
        // We try a maximum of 4 rotations (0, 90, 180, 270 degrees)
        for (int k = 0; k < 4; k++) {
            // 1. Check if current rotation matches the target
            // C++ vector '==' operator compares size and every element in O(n^2)
            if (mat == target) return true;
            
            // 2. Transpose the matrix (Swap rows and columns)
            // We only iterate 'j' from 'i' to avoid swapping elements back to original
            for (int i = 0; i < n; i++) {
                for (int j = i; j < n; j++) {
                    swap(mat[i][j], mat[j][i]);
                }
            }
            
            // 3. Reverse each row to achieve a 90-degree clockwise rotation
            for (int i = 0; i < n; i++) {
                reverse(mat[i].begin(), mat[i].end());
            }
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