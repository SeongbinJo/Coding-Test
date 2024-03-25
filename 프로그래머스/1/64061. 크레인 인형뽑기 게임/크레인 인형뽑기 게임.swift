import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var answer: Int = 0
    
    var newBoard: [[Int]] = []
    var basket: [Int] = []
    
    //0 요소를 빼고, 인형을 세로로 재정렬
    for i in 0...board.count - 1 {
        newBoard.append(board.map{ $0[i] }.filter{ $0 != 0 })
    }
    
    for num in moves {
        if !newBoard[num - 1].isEmpty {
            basket.append(newBoard[num - 1].removeFirst()) //해당 세로 줄 인형 뽑기
            //뽑은 인형 배열에 같은 인형 2개가 붙어있는 것을 찾아 해당 인형들을 제거하고, 그 수를 체크
            if duplicationDoll(basket: basket) {
                basket.removeSubrange(basket.count - 2...basket.count - 1)
                answer += 2
            }
        }
    }
    return answer
}

//basket안의 2개 연속된 숫자를 구분하는 함수
func duplicationDoll(basket: [Int]) -> Bool {
    var result: Bool = false
    if basket.count >= 2 {
        if basket[basket.count - 2] == basket.last {
            result = true
        }
    }else {
        result = false
    }
    return result
}