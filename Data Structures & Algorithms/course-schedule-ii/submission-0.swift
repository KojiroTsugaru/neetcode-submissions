class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjList = [Int: [Int]]()
        for pre in prerequisites {
            adjList[pre[0], default: []].append(pre[1])
        }

        // valid: you can take to finish all courses

        var visited = Set<Int>()
        var visiting = Set<Int>()
        var res = [Int]()
        func dfs(_ crs: Int) -> Bool {
            if visiting.contains(crs) {
                return false
            }

            if visited.contains(crs) {
                return true
            }
            
            if let pres = adjList[crs] {
                visiting.insert(crs)
                for pre in pres {
                    if !dfs(pre) {
                        return false
                    }
                }
                visiting.remove(crs)
            }

            visited.insert(crs)
            res.append(crs)
            return true
        }

        // check taken set's length is equal to numCourses
        for i in 0..<numCourses {
            if !dfs(i) {
                return []
            }
        }

        return res
    }
}
