class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

        var adjList = [Int: [Int]]()
        for pre in prerequisites {
            adjList[pre[0], default: []].append(pre[1])
        }

        var visit = Set<Int>()
        func dfs(_ i: Int) -> Bool {
            if visit.contains(i) {
                return false
            }
            if adjList[i] == [] {
                return true
            }

            visit.insert(i)
            if let preqs = adjList[i] {
                for p in preqs {
                    if !dfs(p) {
                        return false
                    }
                }
            }
            visit.remove(i)
            adjList[i] = []

            return true
        }

        for crs in 0..<numCourses{
            if !dfs(crs) {
                return false
            }
        }

        return true
    }
}