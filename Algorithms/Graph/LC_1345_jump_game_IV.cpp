/*Problem link: https://leetcode.com/problems/jump-game-iv/ 
Description: Given an array of integers, we can jump from index i to index j if either:
(1) j == i + 1  or  (2)  j == i - 1   or  (3) arr[i] == arr[j] and i != j
We've to return the minimum number of jumps to reach the last index.
Technique: BFS
Time complexity: O(n), Space complexity: O(n)
**Note: This problem is a textbook example of finding the shortest path in an unweighted graph.
* node = every index, edge = every jump, weight = 1 (unweighted graph, cost of every jump is 1).....That's why BFS is the best approach here.
*/

#include<bits/stdc++.h>
using namespace std;

class Solution {
public:
    int minJumps(vector<int>& arr) {

        int n = arr.size();
        if (n == 1)  return 0;

        unordered_map <int, vector<int>> hm;         // value -> list of indices having that value
        queue <pair<int, int>> q;                    // {node, distance}
        vector <bool> visited(n, false);             // to keep track of visited nodes

        for (int i = 0; i < n; i++) {
            hm[arr[i]].push_back(i);
        }

        q.push({0, 0});

        while (!q.empty()) 
        {
            int node = q.front().first;
            int dist = q.front().second;
            q.pop();

            if (node == n - 1)
                return dist;

            if (node + 1 < n && !visited[node + 1]) {
                q.push({node + 1, dist + 1});
                visited[node + 1] = true;
            }
            if (node - 1 >= 0 && !visited[node - 1]) {
                q.push({node - 1, dist + 1});
                visited[node - 1] = true;
            }

            for (int x : hm[arr[node]]) {                 // jump to all indices having the same value as arr[node]
                if (!visited[x]) {
                    q.push({x, dist + 1});
                    visited[x] = true;
                }
            }
            hm[arr[node]].clear();                     // IMPORTANT: clear the list to prevent future redundant jumps to the same value's indices
        }
        return -1;
    }
};

int main()
{
    Solution sol;
    vector <int> arr = {100,-23,-23,404,100,23,23,23,3,404};
    
    cout << sol.minJumps(arr) << endl;       // Output: 3 (index 0 -> 4 -> 3 -> 9)

    return 0;
}