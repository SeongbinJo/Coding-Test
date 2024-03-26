import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var answer: Int = 0
    
    var array: [Int] = []
    
    for i in ingredient {
        array.append(i)
        if array.count < 4 { continue }
        if array[array.count - 4...array.count - 1] == [1, 2, 3, 1] {
            array.removeSubrange(array.count - 4...array.count - 1)
            answer += 1
        }
    }
    
    return answer
}