import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    var answer: [Int] = []
    
    var wallpaperArray: [[Int]] = []

    var existFileCol: [Int] = [] //행에 파일이 존재하는 인덱스를 저장
    var existFileRow: [Int] = [] //열에 파일이 존재하는 인덱스를 저장
    
    for column in wallpaper {
        wallpaperArray.append(column.map{ Int(String([$0 == "." ? "0" : "1"]))! })
    }
    
    //1이 나온 위치가 가장 작은 곳과 가장 큰 곳(열)을 체크, Column들 중 1을 가지고있는 최소 행과 최대 행을 체크. 이를 조합하면 됨.
    for (index, column) in wallpaperArray.enumerated() {
        if column.contains(1) {
            //해당 행에 파일이 존재함.
            existFileCol.append(index)
            existFileRow.append(column.firstIndex(of: 1)!)
            existFileRow.append(column.lastIndex(of: 1)!)
        }
    }
    
    answer.append(existFileCol.min()!) //시작점의 행
    answer.append(existFileRow.min()!) //시작점의 열
    answer.append(existFileCol.max()! + 1) //끝점의 행
    answer.append(existFileRow.max()! + 1) //끝점의 열
    
    return answer
}
