import Foundation

func solution(_ new_id:String) -> String {
    
    let stepOne: String = new_id.lowercased()
    
    let stepTwo: String = stepOne.replacingOccurrences(of: "[^a-z0-9._\\-]", with: "", options: .regularExpression)
    
    let stepThree: String = stepTwo.replacingOccurrences(of: "\\.+", with: ".", options: .regularExpression)
    
    var stepFour: String = stepThree.replacingOccurrences(of: "^\\.", with: "", options: .regularExpression)
    stepFour = stepFour.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    
    if stepFour == "" {
        stepFour = "a"
    }
    
    if stepFour.count >= 16 {
        stepFour = String(stepFour.prefix(15))
        stepFour = stepFour.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    }else if stepFour.count <= 2 {
        while(stepFour.count < 3) {
            guard let stepFourLastChar = stepFour.last else {return ""}
            
            stepFour = stepFour + String(stepFourLastChar)
            
        }
    }
    
    return stepFour
}