import UIKit

var scores: [String:Int?]=["김풍상":69,"박화상":0,"고진상":75,"조정상":nil,"이외상":45]
var totalScore=0
var count: Int?
count = 0
print(scores)

for (name, score) in scores{
    if let _score = score{
        print("\(name): \(_score)")
        totalScore += _score
        if let _count = count{
            count = _count+1
        }
        
    }
    else{
        print("\(name): 결시")
    }
}
print("합격자 명단")
for (name, score) in scores{
    if let _score = score{
        if _score>60{
            print("\(name) \(_score)점")
        }
    }
}
print("응시자 총 점수: \(totalScore)")
if let _count = count{
    print("응시자 평균 점수: \(Float(totalScore)/Float(_count))")
}
