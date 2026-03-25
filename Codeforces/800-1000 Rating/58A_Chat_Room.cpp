/* Problem link: https://codeforces.com/contest/58/problem/A
- Greedy technique for Subsequence matching
Time complexity: O(n)    */

#include <bits/stdc++.h>
using namespace std;
#define endl '\n';
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    string s, target = "hello";
    cin >> s;

    int j = 0;
    for(int i=0; i<s.length(); i++)
    {
        if(s[i] == target[j])
        {
            j++;
        }
    }

    if(j == 5){
        cout << "YES" <<endl;
    }
    else 
        cout << "NO" <<endl;
}