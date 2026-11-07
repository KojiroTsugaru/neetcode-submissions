class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var pres = [Int: [Int]]()

        for p in prerequisites {
            pres[p[0], default: []].append(p[1])
        }

        var taken = Set<Int>()
        func dfs(_ crs: Int) -> Bool {
            if taken.contains(crs) {
                return false
            }

            guard let crses = pres[crs] else { return true }

            taken.insert(crs)
            for c in crses {
                if !dfs(c) {
                    return false
                }
            }
            taken.remove(crs)
            pres[crs] = []

            return true
        }


        for crs in 0..<numCourses {
            if !dfs(crs) {
                return false
            }
        }

        return true 
    }
}