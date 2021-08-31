import UIKit

//Chapter10 프로퍼티와 메서드
//10.1 프로퍼티
/*
 10.1.1 저장 프로퍼티
 저장 프로퍼티: 인스턴스의 변수 또는 상수를 의미. 구조체와 클래스에서만 사용
 기존 프로그래밍 언어에서 사용되돈 인스턴스 변수는 저장 프로퍼티
 */
//10-1 저장 프로퍼티의 선언 및 인스턴스 생성
//좌표
struct CoordinatePoint {
    var x: Int  //저장 프로퍼티
    var y: Int  //저장 프로퍼티
}

//구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다.
/*
 NOTE_구조체와 클래스의 저장 프로퍼티
 구조체의 저장 프로퍼티를 모두 포함하는 이니셜라이저를 자동으로 생성한다.
 클래스의 저장 프로퍼티는 옵셔널이 아니라면 프로퍼티 기본값을 지정해주거나 사용자 정의 이니셜 라이저를 통해 반드시 초기화해주어야 한다.
 */
let yhPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

//사람의 위치 정보
class Position {
    var point: CoordinatePoint //저장 프로퍼티(변수) - 위치(point)는 변경될 수 있음을 뜻한다.
    let name: String //저장 프로퍼티(상수)
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

//사용자 정의 이니셜 라이저를 호출해야 한다.
//그렇지 않으면 프로퍼티 초기값을 할당할 수 없기 때문에 인스턴스 생성이 불가능하다.
let yhPosition: Position = Position(name: "yh", currentPoint: yhPoint)


//10-2 저장 프로퍼티의 초깃값 지정
//클래스의 저장 프로퍼티에 초깃값을 지정해주면 따로 사용자 정의 이니셜라이저를 구현해줄 필요가 없다
struct CoordinatePoint2 {//구조체
    var x: Int = 0 //저장 프로퍼티
    var y: Int = 0 //저장 프로퍼티
}

//프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없다.
let man1Point: CoordinatePoint2 = CoordinatePoint2()

//물론 기존에 초깃값을 할당할 수 있는 이니셜라이저도 사용 가능
let man2Point:CoordinatePoint2 = CoordinatePoint2(x: 10, y: 5)

print("man1's Point: \(man1Point.x), \(man1Point.y)")
print("man2's Point: \(man2Point.x), \(man2Point.y)")

class Position2 {
    var point: CoordinatePoint2 = CoordinatePoint2() //저장 프로퍼티
    var name: String = "Unknown"  //저장 프로퍼티
}

//초깃값을 지정해줬다면 사용자 정의 이니셜 라이저를 사용하지 않아도 된다.
let manPosition: Position2 = Position2()
print(manPosition.name, manPosition.point)

manPosition.name = "man"
let man3Point: CoordinatePoint2 = CoordinatePoint2(x: 11, y: 100)
manPosition.point = man3Point
print(manPosition.name, manPosition.point)



/*
 10-3 옵셔널 저장 프로퍼티
 옵셔널이라면 굳이 초깃값을 넣어주지 않아도 된다.
 즉, 이니셜라이저에서 옵셔널 프로퍼티에 꼭 값을 할당해주지 않아도 된다.
 옵셔널의 사용과 사용자 정의 이니셜라이저를 적절히 혼합하여 의도에 맞는 구조체와 클래스를 정의해야한다.
 */
struct CoordinatePoint3 {
    //위치는 x, y 값이 모두 있어야 하므로 옵셔널이면 안 된다.
    var x: Int
    var y: Int
}

class Position3 {
    //현재 사람의 위치를 모를 수도 있다 - 옵셔널
    var position: CoordinatePoint3?
    let name: String
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다.
    init(name: String) {
        self.name = name
    }
}

//이름은 필수지만 위치는 모를 수 있다.
let man2Position: Position3 = Position3(name: "man2Position")

//위치를 알게 되면 그때 위치 값을 할당한다.
man2Position.position = CoordinatePoint3(x: 200, y: 4300)

//이렇게 옵셔널과 이니셜라이저를 적절히 사용하면 다른 프로그래머가 사용할 때, 내가 처음 의도했던 대로 구조체와 클래스를 사용할 수 있도록 유도할 수 있다.

