import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var answer = ""
    
    let keypad: [[String]] = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["*", "0", "#"]]
    
    var handStatus: [String: String] = ["Left": "*", "Right": "#"]
    
    for number in numbers {
        switch number {
            case 1, 4, 7:
            handStatus["Left"] = "\(number)"
            answer += "L"
            case 3, 6, 9:
            handStatus["Right"] = "\(number)"
            answer += "R"
            case 2, 5, 8, 0:
            let keypadLocation: [Int] = getIndex(number: "\(number)", keypadAry: keypad)
            let leftHandLocation: [Int] = getIndex(number: handStatus["Left"]!, keypadAry: keypad)
            let rightHandLocation: [Int] = getIndex(number: handStatus["Right"]!, keypadAry: keypad)
            let resultHand: String = calculator(keypadNumber: keypadLocation, leftNumber: leftHandLocation, rightNumber: rightHandLocation, hand: hand)
            if resultHand == "left" {
                handStatus["Left"] = "\(number)"
                answer += "L"
            }else {
                handStatus["Right"] = "\(number)"
                answer += "R"
            }
            default:
            print("default")
        }
    }
    
    return answer
}

//특정 숫자의 2차원 배열 인덱스를 찾아주는 함수.
func getIndex(number: String, keypadAry: [[String]]) -> [Int] {
    var result: [Int] = []
    for (index, array) in keypadAry.enumerated() {
                if array.contains(number) {
                    result.append(index)
                    result.append(array.firstIndex(of: number)!)
                    break
                }else {
                    print("keypad[\(index)]에서 \(number)을(를) 찾지 못했음.")
                }
            }
    return result
}

//숫자 간의 거리를 계산하는 함수.
func calculator(keypadNumber: [Int], leftNumber: [Int], rightNumber: [Int], hand: String) -> String {
    let leftDistance: Int = abs(keypadNumber[0] - leftNumber[0]) + abs(keypadNumber[1] - leftNumber[1])
    let rightDistance: Int = abs(keypadNumber[0] - rightNumber[0]) + abs(keypadNumber[1] - rightNumber[1])
    
    if leftDistance == rightDistance {
        if hand == "left" {
            return "left"
        }else if hand == "right"{
            return "right"
        }
    }else if leftDistance > rightDistance {
        return "right"
    }else {
        return "left"
    }
    
    return ""
}