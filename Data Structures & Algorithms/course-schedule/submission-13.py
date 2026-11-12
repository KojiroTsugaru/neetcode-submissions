class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        preMap = {}
        
        for crs, pre in prerequisites:
            if crs not in preMap:
                preMap[crs] = []
            preMap[crs].append(pre)

        visit = set()
        def dfs(crs) -> bool:
            if crs in visit:
                return False
            
            if crs not in preMap:
                return True

            visit.add(crs)
            for pre in preMap[crs]:
                if not dfs(pre):
                    return False
                
            preMap[crs] = []
            visit.remove(crs)

            return True

        
        for crs in range(numCourses):
            if not dfs(crs):
                return False
            
        
        return True