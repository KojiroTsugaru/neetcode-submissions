class Solution:
    def minWindow(self, s: str, t: str) -> str:
        tCount = Counter(t)
        
        need = len(tCount)
        have = 0
        res = [-1, -1]
        resLen = float('inf')

        l = 0
        for r in range(len(s)):
            if s[r] in tCount:
                tCount[s[r]] -= 1

                if tCount[s[r]] == 0:
                    have += 1

            while need == have:
                if (r - l + 1) < resLen:
                    res = [l, r]
                    resLen = (r - l + 1)

                if s[l] in tCount:
                    tCount[s[l]] += 1
                    if tCount[s[l]] > 0:
                        have -= 1
                l += 1

        if res[0] == -1:
            return ""
        l, r = res[0], res[1]
        return s[l: r+1]
            