#Problem link: https://leetcode.com/problems/valid-parentheses/
#Technique: Stack
#Time complexity: O(n)
#Space complexity: O(n)

class Solution:
    def isValid(self, s: str) -> bool:
        ls = []
        for ch in s:
            if ch == '(' or ch == '{' or ch == '[':
                ls.append(ch)
            else:
                if not ls:
                    return False
                top = ls.pop()
                if ch == ')' and top != '(':
                    return False
                elif ch == '}' and top != '{':
                    return False
                elif ch == ']' and top != '[':
                    return False
        if ls:
            return False
        else:
            return True
    
result = Solution().isValid("()[]{}")
print(result)