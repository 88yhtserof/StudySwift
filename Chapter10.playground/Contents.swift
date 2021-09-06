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


/*
 10.1.2 지연 저장 프로퍼티
 호출이 있어야 값을 초기화 하는 지연 저장 프로퍼티(Lazy Stored Properties)
 lazy 키워드
 상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 필요할 때 값을 할당하는 지연 저장 프로퍼티와는 맞지 않는다.
 따라서 지연 저장 프로퍼티는 var 키워드를 사용하여 변수로 저장한다.
 지연 저장 프로퍼티를 잘 사용하면 불필요한 성능저하나 공간 낭비를 줄일 수 있다.
 */
//10-4 지연 저장 프로퍼티
struct CoordinatePoint4 {
    var x: Int = 0
    var y: Int = 0
}

class Position4 {
    lazy var point: CoordinatePoint4 = CoordinatePoint4()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


let man3Position: Position4 = Position4(name: "man3")

//이 코드를 통해 point 프로퍼티로 처음 접근할 때
//point 프로퍼티의 CoordinatePoint가 생성된다.
//호출이 있어야 값을 초기화하는 지연 저장 프로퍼티
print(man3Position.point) //x: 0, y:0

/*
 NOTE_ 다중 스레드와 지연 저장 프로퍼티
 생성되지 않은 지연 저장 프로퍼티에 많은 스레드가 비슷한 시점에 접근한다면, 여러 번 초기화될 수 있다.
 */


//10.1.3 연산 프로퍼티
//10-5 메서드로 구현된 접근자와 설정자
struct CoordinatePoint5 {
    var x: Int //저장 프로퍼티
    var y: Int //저장 프로퍼티
    
    //대칭좀울 구하는 메서드 - 접근자
    //Self는 타입 자기 자신을 뜻한다.
    //Self 대신 CoordinatePoint를 사용해도 된다
    func oppositePoint() -> Self {
        return CoordinatePoint5(x: -x, y: -y)
    }
    
    
    //대칭점을 설정하는 메서드 - 설정자
    //mutating 키워드에 관한 내용은 10.2.1절에서 다룬다.
    mutating func setOppositePoint(_ opposite: CoordinatePoint5) {
        x = -opposite.x
        y = -opposite.y
    }
}

var man4Position: CoordinatePoint5 = CoordinatePoint5(x: 10, y: 20)

print(man4Position) //현재 좌표 10, 20

print(man4Position.oppositePoint()) //대칭 좌표 -10, -20

//대칭 좌표를 (15, 10)으로 설정하면
man4Position.setOppositePoint(CoordinatePoint5(x: 15, y: 10))

//현재 좌표는 -15, -10으로 설정된다
print(man4Position)


//10-6 연산 프로퍼티의 정의와 사용
struct CoordinatePoint6 {
    var x: Int //저장 프로퍼티
    var y: Int //저장 프로퍼티
    
    //대칭 좌표
    var oppositePoint: CoordinatePoint6 { //연산 프로퍼티
        //접근자
        get {
            return CoordinatePoint6(x: -x, y: -y)
        }
        
        //설정자
        set(opposite){
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var man5Position:CoordinatePoint6 = CoordinatePoint6(x: 10, y: 20)

//현재 좌표
print(man5Position) //10, 20

//대칭 좌표
//연산 프로퍼티 접근자 get
print(man5Position.oppositePoint) //-10, -20

//대칭 좌표를 (15, 10)으로 설정하면
//연산 프로퍼티 설정자 set
man5Position.oppositePoint = CoordinatePoint6(x: 15, y: 10)

//현재 좌표는 -15, -10으로 설정된다.
print(man5Position) //-15, -10

/*
 10-7 매개변수 이름을 생략한 설정자
 접근자 내부의 코드가 다 한 줄이고 그 결괏값의 타입이 프로퍼티의 타입과 같다면,
 return 키워드를 생략해도 그 결괏값이 접근자의 반환값이 된다.
 newValue로 매개변수 이름을 대신할 수 있다
 */
struct CoordinatePoint7 {
    var x: Int //저장 프로퍼티
    var y: Int //저장 프로퍼티
    
    //대칭 좌표
    var oppositePoint: CoordinatePoint7 {
        //접근자
        get {
            //return CoordinatePoint7(x: -x, y: -y) 와 같다
            CoordinatePoint7(x: -x, y: -y)
        }
        
        //설정자
        set{
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var man6Position:CoordinatePoint6 = CoordinatePoint6(x: 10, y: 20)

//현재 좌표
print(man6Position) //10, 20

//대칭 좌표
//연산 프로퍼티 접근자 get
print(man6Position.oppositePoint) //-10, -20

//대칭 좌표를 (15, 10)으로 설정하면
//연산 프로퍼티 설정자 set
man6Position.oppositePoint = CoordinatePoint6(x: 15, y: 10)

//현재 좌표는 -15, -10으로 설정된다.
print(man6Position) //-15, -10

/*
 설정자가 필요없다면 읽기 전용으로 연산 프로퍼티를 사용할 수 있다.
 연산 프로퍼티에 get 메서드만 구현한다.
 */
