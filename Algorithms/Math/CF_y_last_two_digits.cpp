//Problem link: https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/Y

#include <bits/stdc++.h>
#define ll long long
#define endl "\n"

using namespace std;
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    ll a, b, c, d;
    cin >> a >> b >> c >> d;

    // We can't simply multiply all the numbers and then take the last two digits, because the product can be very large. Instead, we can take the last two digits at each step to keep the number manageable.
    ll x = 1;
    x = (x * a) % 100;
    x = (x * b) % 100;
    x = (x * c) % 100;
    x = (x * d) % 100;

    if (x < 10) cout << '0' << x << endl;            // If the last two digits are less than 10, we need to add a leading zero to maintain the two-digit format.
    else cout << x << endl;
    return 0;
}