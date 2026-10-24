class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let n = position.count
        var cars = [(pos: Int, speed: Int)]()
        for i in 0..<n {
            cars.append((position[i], speed[i]))
        }
        cars.sort { $0.pos > $1.pos }
        
        var stack = [Double]()

        for car in cars {
            let curTime = Double(target - car.pos) / Double(car.speed)

            if stack.isEmpty || curTime > stack.last! {
                stack.append(curTime)
            }
        }

        return stack.count
    }
}