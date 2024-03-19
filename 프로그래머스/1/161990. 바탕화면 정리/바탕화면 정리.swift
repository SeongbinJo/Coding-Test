import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    var answer: [Int] = []
    
    var wallpaperArray: [[Int]] = []

    var existFileCol: [Int] = [] //행에 파일이 존재하는 인덱스를 저장
    var existFileRow: [Int] = [] //열에 파일이 존재하는 인덱스를 저장
    
    for column in wallpaper {
        wallpaperArray.append(column.map{ Int(String([$0 == "." ? "0" : "1"]))! })
    }
    
    for (index, column) in wallpaperArray.enumerated() {
        if column.contains(1) {
            existFileCol.append(index)
            existFileRow.append(column.firstIndex(of: 1)!)
            existFileRow.append(column.lastIndex(of: 1)!)
        }
    }
    
    answer.append(existFileCol.min()!)
    answer.append(existFileRow.min()!)
    answer.append(existFileCol.max()! + 1)
    answer.append(existFileRow.max()! + 1)
    
    return answer
}