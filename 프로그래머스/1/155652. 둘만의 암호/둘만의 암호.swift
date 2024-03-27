import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    var answer: String = ""

    var str: [String] = s.map{ String($0) }
    var alphabet: [String] = "abcdefghijklmnopqrstuvwxyz".map{String($0)}
    
    for alpha in skip {
        if alphabet.contains(String(alpha)) {
            alphabet.remove(at: alphabet.firstIndex(of: String(alpha))!)   
        }else {
            continue
        }
    }
    
    for (i, alpha) in str.enumerated() {
        let num1 = alphabet.count - 1
        let num2 = alphabet.firstIndex(of: String(alpha))!
        var num3 = num2 + index - num1 - 1
        
        if num1 - num2 >= index {
            str[i] = alphabet[num2 + index]
        }else {
            if num3 > num1 {
                while(num3 > num1) {
                    num3 -= (num1 + 1)
                }
                str[i] = alphabet[num3]
            }else {
                str[i] = alphabet[num3]
            }
        }
    }
    
    answer = str.joined()
    
    return answer
}