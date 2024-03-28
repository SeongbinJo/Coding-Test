import Foundation

func solution(_ X:String, _ Y:String) -> String {
    
    var answer: String = ""
    
    var x: [Int: Int] = [:]
    var y: [Int: Int] = [:]
    
    var X: [Int] = X.map{Int(String($0))!}
    var Y: [Int] = Y.map{Int(String($0))!}
    var Z: [Int] = []
    
    var count: Int = 0
    
    for i in X {
        x[i] = (x[i] ?? 0) + 1
    }
    
    for i in Y {
        y[i] = (y[i] ?? 0) + 1
    }
    
    for (xkey, xvalue) in x {
        for (ykey, yvalue) in y {
            if xkey == ykey {
                for i in 0..<(xvalue > yvalue ? yvalue : xvalue) {
                    Z.append(xkey)
                }
                count += 1
            }else {
                continue
            }
        }
    }
    
    if count == 0 {
        answer = "-1"
    }else {
        Z = Z.sorted(by: >)
        for i in Z {
            answer += String(i)
        }
        answer = answer.replacingOccurrences(of: "^0{2,}",with: "0", options: .regularExpression)
    }

    
    return answer
}