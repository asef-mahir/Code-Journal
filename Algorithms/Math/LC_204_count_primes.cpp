#include<bits/stdc++.h>
using namespace std;

/**
 * Problem: Count the number of prime numbers less than n.
 * Problem link: https://leetcode.com/problems/count-primes/description/
 * Algorithm: Sieve of Eratosthenes
 * Time Complexity: O(n log log n)
 * Space Complexity: O(n)
 */

class Solution {
public:
    int countPrimes(int n) {
        if (n <= 2) {
            return 0;
        }

        // Initialize a boolean vector to keep track of prime numbers.
        // Assume all numbers are prime (true) initially.
        // vector<bool> is space-optimized in C++.
        vector<bool> prime(n, true);
        prime[0] = prime[1] = false;

        // Start the sieve process from the first prime, 2.
        // Optimization: We only need to iterate up to the square root of n.

        for (int i = 2; i * i < n; i++) {
            if (prime[i]) {
                /**
                 * Mark all multiples of 'i' as not prime (false).
                 * Optimization: Start marking from i * i.
                 * Any multiple smaller than i * i (like 2*i, 3*i)
                 * would have already been marked by smaller primes.
                 */
                for (int j = i * i; j < n; j += i) {
                    prime[j] = false;
                }
            }
        }

        int cnt = 0;
        for (bool x : prime) {
            if (x == true) {
                cnt++;
            }
        }

        return cnt;
    }
};

int main()
{
    Solution obj;
    cout << obj.countPrimes(10) << endl;    //let, n = 10
}