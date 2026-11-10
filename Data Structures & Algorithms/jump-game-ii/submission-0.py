class Solution:
    def jump(self, nums: List[int]) -> int:
        INF = 10**18 
        minJump = [INF] * len(nums)
        
        minJump[0] = 0
        for i, n in enumerate(nums):
            curJump = minJump[i]
            for j in range(i+1, i+n+1):
                if j < len(nums):
                    minJump[j] = min(minJump[j], curJump + 1)

        return minJump[-1]


        # minJump
        # [0,1,1,inf,inf,inf] i = 0
        # [0,1,1,2,2,2] i = 1
        # [0,1,1,2,2,2] i = 2

        # [2,1,1,inf,inf] i = 0
        # [2,1,1,inf,inf] i = 1
        # [2,1,1,2,2] i = 2
        # [2,1,1,2,2] i = 3
        # [2,1,1,2,2] i = 4