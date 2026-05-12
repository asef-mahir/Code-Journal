/* Problem Link: https://codeforces.com/contest/1003/problem/A
-Logic: The min pockets needed = the max frequency of any single coin value.
-used unordered_map to count occurences and iterated the map for finding out the 
-largest value (pointer->first = key, pointer->second = value).
-Complexity: Time O(n), Space O(n) */

#include <bits/stdc++.h>
using namespace std;
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    int n;
    vector<int> vc;
    unordered_map<int, int> hmp;

    cin >> n;
    int x;
    for (int i = 0; i < n; i++)
    {
        cin >> x;
        vc.push_back(x);
        hmp[vc[i]]++;
    }

    auto maxi = hmp.begin();

    for (auto it = hmp.begin(); it != hmp.end(); ++it)
    {
        if (it->second > maxi->second)
        {
            maxi = it;
        }
    }

    cout << maxi->second << endl;
}