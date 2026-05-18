/*Problem link: https://leetcode.com/problems/jump-game-iii/
Description: Given an array of non-negative integers arr, we are initially positioned at start index of the array. When we are at index i, we can jump to i + arr[i] or i - arr[i], check if we can reach to any index with value 0.
Technique: BFS
Time complexity: O(n), Space complexity: O(n)
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    bool canReach(vector<int>& arr, int start) {

        int n = arr.size();
        vector <bool> visited (n, false);
        queue <int> q;

        q.push(start);
        visited[start] = true;

        while(!q.empty())
        {
            int curr = q.front();
            q.pop();

            if(arr[curr] == 0){
                return true;
            }

            int forward = curr + arr[curr];
            int backward = curr - arr[curr];

            if(forward >= 0 && forward < n && !visited[forward]){
                q.push(forward);
                visited[forward] = true;
            }
            if(backward >= 0 && backward < n && !visited[backward]){
                q.push(backward);
                visited[backward] = true;
            }
        }
        return false;
    }
};

int main()
{
    Solution sol;
    vector <int> arr = {4,2,3,0,3,1,2};
    int start = 5;

    cout << sol.canReach(arr, start) << endl;       // Output: true

    return 0;
}