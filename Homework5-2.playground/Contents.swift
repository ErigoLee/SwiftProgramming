import UIKit

// Homework5-1의 도형 클래스
class Shape {
    var numberOfSides: Int?
    
    init(numberOfSides:Int?){
        self.numberOfSides = numberOfSides
    }
    
    func description() -> String{
        if let numberOfSides = numberOfSides{
            return "\(numberOfSides)변을 갖는 도형"
        }
        else{
            return "도형"
        }
    }}

// 원 클래스
class Circle : Shape {
    var radius: Double
    var curcumference: Double{
        get{
            return self.radius*2.0*Double.pi
        }
        set{
            self.radius = newValue/(2.0*Double.pi)
        }
    }
    
    init(radius:Double){
        self.radius = radius
        super.init(numberOfSides: nil)
    }
    override func description() -> String {
        return "도형(반지름->\(radius)인 원)"
    }
    func area()->String{
        return "\(self.radius*self.radius*Double.pi)"
    }
}

let shape1 = Shape(numberOfSides: nil)          // Shape 틀래스는 Homework5-1의 Shape 클래스 사용, 원의 변의 갯수는 nil(없음)
print(shape1.description())
let shape2 = Shape(numberOfSides: 4)
print(shape2.description())
let circle = Circle(radius: 10.7)              // radius는 반지름, Double 타입
print(circle.description())                    // 재정의한 description 호출
print(circle.area())                           // 면적 계산에 필요한 파이는 Double.pi(Double 구조체의 pi 상수)를 사용
print(circle.curcumference)                    // curcumference는 원주, computed property로 구현
circle.curcumference = 50
print(circle.area())
