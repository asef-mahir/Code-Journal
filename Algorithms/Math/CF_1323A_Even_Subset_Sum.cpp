//Problem link: https://codeforces.com/problemset/problem/1323/A

#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define endl '\n'
int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    int t, n;
    cin >> t;
    while (t--)
    {
        cin >> n;
        vector<int> vc(n);
        for (int i = 0; i < n; i++)
        {
            cin >> vc[i];
        }

        int f = 0;
        for (int i = 0; i < n; i++)
        {
            if (vc[i] % 2 == 0)
            {
                cout << 1 << endl
                     << i + 1 << endl;
                f = 1;
                break;
            }
        }

        if (f == 0)
        {
            for (int i = 0; i < n - 1; i++)
            {
                if ((vc[i] + vc[i + 1]) % 2 == 0)
                {
                    cout << 2 << endl << i + 1 << " " << i + 2 << endl;
                    f = 1;
                    break;
                }
            }
        }

        if (f == 0)
        {
            cout << -1 << endl;
        }
    }
}