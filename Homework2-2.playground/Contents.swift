import UIKit

var scores = ["김풍상":69,"박화상":38, "고진상":75, "조정상":61, "이외상":45]
var totalSocre = 0

print("합격자 명단")
for (name, score) in scores{
    if score > 60{
        print(name+" "+String(score)+"점")
    }
    totalSocre += score
}
print("총 점수: "+String(totalSocre))
scores["총점"] = totalSocre
print(scores)
