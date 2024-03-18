import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    print(privacies)
    //정답을 담을 배열
    var answer: [Int] = []
    
    //입력받은 오늘 날짜의 분리. [2022, 04, 12]
    let nowDate: [Int] = separateDate(date: today)
    
    var termDic: [String: String] = [:]
    
    //약관 종류와 유효 기간 Dictionary 분류 
     for i in terms {
         termDic[separateStr(str: i)[0]] = separateStr(str: i)[1]
     }
    
    //privacies 요소 개수만큼 반복문 => 분리한 날짜에 약관 기간을 더한 값이 nowDate 이상인 경우 result에 인덱스 번호 + 1을 담아야함.
    for (i, term) in privacies.enumerated() {
        let separateTerm = separateStr(str: term) //["2022.03.14", "A"]
        let intToDate = separateDate(date: separateTerm[0]) //[2022, 3, 14]

        if !caculateDate(date: intToDate, today: nowDate, term: Int(termDic[separateTerm[1]]!)!) {
            //유효 기간이 초과일 경우 an
            answer.append(i + 1)
        }
    }  
    return answer
}

//문자열 날짜를 받아 [Int] 날짜로 되돌려주는 함수
func separateDate(date: String) -> [Int] {
    let strResult = date.split(separator: ".")
    var numResult: [Int] = []
    
    for i in strResult {
        numResult.append(Int(i)!)
    }
    
    return numResult
}

//문자열 분리하는 함수
func separateStr(str: String) -> [String] {
    let result = str.split(separator: " ")
    var strResult: [String] = []
    
    for i in result {
        strResult.append(String(i))
    }
    
    return strResult
}

func caculateDate(date: [Int], today: [Int], term: Int) -> Bool {
    var sumYear: Int = date[0]
    var sumMonth: Int = date[1] + term
    var resultDate: DateComponents = DateComponents(year: date[0], month: date[1], day: date[2])
    let todayDate: DateComponents = DateComponents(year: today[0], month: today[1], day: today[2])
    
    //유효기간을 더한 값이 12월이 넘어가지 않는 경우
    if sumMonth <= 12 {
        resultDate = DateComponents(year: sumYear, month: sumMonth, day: date[2])
        //오늘 날짜와 비교, 값이 음수일 경우 false 리턴(파기), 양수일 경우 true 리턴(패스)
        let result = calculate(from: todayDate, to: resultDate)
        return result
    }
    else { //유효기간을 더한 값이 12월이 초과할 경우, 년도를 1 증가하고 비교해야함.
        while(sumMonth > 12) {
            sumMonth = sumMonth - 12
            sumYear = sumYear + 1
        }
        resultDate = DateComponents(year: sumYear, month: sumMonth, day: date[2])
        let result = calculate(from: todayDate, to: resultDate)
        return result
    }
}

func calculate(from todayDate: DateComponents, to resultDate: DateComponents) -> Bool {
    let result = Calendar.current.dateComponents([.year, .month, .day], from: todayDate, to: resultDate)
        guard result.year! == 0 else {
            if result.year! > 0 {
                return true
            }else {
                return false
            }
        }
        guard result.month! == 0 else {
            if result.month! > 0 {
                return true
            }else {
                return false
            }
        }
        guard result.day! <= 0 else {
            return true
        }
        return false
}
