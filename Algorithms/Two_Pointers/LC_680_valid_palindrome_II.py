# Problem link: https://leetcode.com/problems/valid-palindrome-ii/
# Statement: Given a string s, return true if the s can be palindrome after deleting at most one character from it.
# Technique: Two Pointers
# Time Complexity: O(n), Space Complexity: O(n) for worst case, O(1) for best case

class Solution:
    def validPalindrome(self, s: str) -> bool:
        l = 0
        r = len(s) - 1

        while l < r:
            if s[l] == s[r]:
                l += 1
                r -= 1
            else:
                # Skip the left character s[l]
                skip_l = s[l + 1 : r + 1]
                # Skip the right character s[r]
                skip_r = s[l:r]

                # Check if either substring is equal to its reverse
                if skip_l == skip_l[::-1] or skip_r == skip_r[::-1]:
                    return True
                else:
                    return False
        return True
    
result = Solution().validPalindrome("abca")
print(result)

## Explanation: We could delete the character 'c'.