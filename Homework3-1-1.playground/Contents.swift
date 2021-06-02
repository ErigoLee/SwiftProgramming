import UIKit

let names: [String] = ["김풍상", "박화상", "고진상", "조정상", "이외상"]
let scores: [Int?] = [69,0,75,nil,45]
var count = 0

var totalScore = 0

print("합격자 명단")
for i in 0..<names.count{
    if let score = scores[i]{
        totalScore += score
        if score > 60{
                print("\(names[i]) \(score)점")
        }
        count=count+1
    }
    
}
print("응시자 총 점수: \(totalScore)점")
print("응시자 평균 점수: \(Float(totalScore)/Float(count))")

