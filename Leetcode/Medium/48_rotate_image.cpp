// Problem link: https://leetcode.com/problems/rotate-image/description/
// Be extra cautious while transposing the matrix
// Complexity: O(n^2)

#include<bits/stdc++.h>
using namespace std;
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {

        // Reverse the vector AKA matrix
        reverse(matrix.begin(), matrix.end());

        // Transpose the matrix AKA swapping the symmetry
        for (int i = 0; i < matrix.size(); i++) {
            for (int j = i + 1; j < matrix.size(); j++) {
                swap(matrix[i][j], matrix[j][i]);
            }
        }
    }
};

int main()
{
    Solution sol;
    vector<vector<int>> vc = {{1,2,3},{4,5,6},{7,8,9}};
    sol.rotate(vc);

    for (const auto& row : vc) {
        for (int num : row) {
            cout << num << ' ';
        }
        cout << '\n';
    }

    return 0;
}