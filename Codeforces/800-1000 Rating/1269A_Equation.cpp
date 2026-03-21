/* Problem link: https://codeforces.com/problemset/problem/1269/A
a - b = n;    let's say: a = p * n and b = q * n;
so, pn - qn = n;      => p - q = 1;
that means p and q has to be two consecutive composite number
and the answer will be pn and qn
we choose p and q as 8 and 9 cz It’s the smallest pair of consecutive composite numbers.
*/

#include<bits/stdc++.h>
using namespace std;
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    int n;
    cin >> n;
    cout << 9*n << " " << 8*n <<endl;
}