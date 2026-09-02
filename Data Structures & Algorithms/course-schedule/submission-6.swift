class Solution {

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = [Int: [Int]]()

        for p in prerequisites {
            adjList[p[0], default: []].append(p[1])
        }

        var visit = Set<Int>()
        var completed = Set<Int>()
        func dfs(_ crs: Int) -> Bool {

            if visit.contains(crs) {
                return false
            }

            if completed.contains(crs) {
                return true
            }

            if let pres = adjList[crs] {
                visit.insert(crs)
                for pre in pres {
                    if !dfs(pre) { return false }
                }
                visit.remove(crs)
            }
            completed.insert(crs)
            return true

        }


        for n in 0..<numCourses {
            if !dfs(n) { return false }
        }   
        return true
    }   
}
