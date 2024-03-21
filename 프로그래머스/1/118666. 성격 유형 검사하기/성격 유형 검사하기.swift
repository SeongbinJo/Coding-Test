import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var answer: String = ""
    
    var result: [String: Int] = [:]
    let alphabet: [String] = ["R", "T", "C", "F", "J", "M", "A", "N"]
    
    for char in alphabet {
        result[char] = 0
    }
    
    for (index, question) in survey.enumerated() {
        guard let firstChar = question.first else { return "" }
        guard let lastChar = question.last else { return "" }
        
        switch choices[index] {
        case 1:
            result[String(firstChar)]! += 3
        case 2:
            result[String(firstChar)]! += 2
        case 3:
            result[String(firstChar)]! += 1
        case 4:
            print("모르겠음을 선택하여 점수가 없습니다.")
        case 5:
            result[String(lastChar)]! += 1
        case 6:
            result[String(lastChar)]! += 2
        case 7:
            result[String(lastChar)]! += 3
        default:
            break
        }
    }
    
    if result["R"]! >= result["T"]! {
        answer += "R"
    }else {
        answer += "T"
    }
    if result["C"]! >= result["F"]! {
        answer += "C"
    }else {
        answer += "F"
    }
    if result["J"]! >= result["M"]! {
        answer += "J"
    }else {
        answer += "M"
    }
    if result["A"]! >= result["N"]! {
        answer += "A"
    }else {
        answer += "N"
    }
    
    return answer
}