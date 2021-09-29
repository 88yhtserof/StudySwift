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


//10.1.4 프로퍼티 감시자
/*
 프로퍼티 감시자 Property Observers
 프로퍼티의 값이 새로 할당될 때마다 호출하기 때문에 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있다.
 저장 프로퍼티, 상속받은 저장 프로퍼티, 상속받은 연산 프로퍼티
 willSet 메서드 : 프로퍼티의 값이 변경되기 직전에 호출. 전달 인자는 프로퍼티가 변결될 값. newValue
 didSet 메서드 : 프로퍼티의 값이 변경된 직후에 호출. 전달 인자는 프로퍼티가 변경되기 전의 값. oldValue
 */
//10-9 프로퍼티 감시자
/*
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()

//잔액이 0원에서 100원으로 변경될 예정입니다.
myAccount.credit = 1000 //이 문장으로 기준으로 프로퍼티 값이 변경되기 직전에 willSet 호출, 직후에 didSet 호출
//잔액이 0원에서 1000원으로 변경되었습니다.
*/

//10-10 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
class Account {
    var credit: Int = 0 { //저장 프로퍼티
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double { //연산 프로퍼티
        get {
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
    
}

class ForeignAccount: Account {
    //연산 프로퍼티 오버라이드(재정의)
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}


let myAccount: ForeignAccount = ForeignAccount()

//잔액이 0원에서 1000원으로 변경되었습니다.
myAccount.credit = 1000 //ForeignAccount가 Account를 상속받았기 때문에 Account의 프로퍼티 사용 가능
//잔액 0원에서 1000원으로 변경되었습니다.

//(1)myAccount.dollarValue = 2 문장, ForeignAccount의 dollarValue프로퍼티 값 할당
//(2)ForeignAccount에 dollarValue의 willSet, 프로퍼티 값 할당 직전 - 잔액이 1.0달러에서 2.0달러로 변경될 예정입니다.
//(3)Account에 dollarValue의 set메서드의 credit 프로퍼티 사용으로 Account의 credit 프로퍼티의 프로퍼티 감시자 호출
//willSet - 잔액이 1000원에서 2000원으로 변경될 예정입니다.
//didSet - 잔액이 1000원에서 2000원으로 변경되었습니다.
myAccount.dollarValue = 2 //(4)Account에 dollarValue의 set메서드의 print문장 - 잔액을 2.0달러로 변경 중입니다.
//(5)ForeignAccount에 dollarValue의 didSet, 프로퍼티 값 할당 직후 - 잔액이 1.0달러에서 2.0달러로 변경되었습니다.


/*
 10.1.5 전역변수와 지역변수
 함수나 메서드, 클로저, 클래스, 구조체, 열거형 등의 범위 안에 포함되지 않았던 변수나 상수
 전역변수 또는 지역변수는 저장변수라고 한다.
 전역변수나 지역변수를 연산변수로 구현할 수도 있으며, 프로퍼티 감시자를 구현할 수도 있다.
 전역변수 또는 전역상수는 지연 저장 프로퍼티처럼 처음 접근할 때 최초로 연산이 이루어진다.
 지역변수 및 지역상수는 절대로 지연 연산되지 않는다.
 */
//10-11 저장변수의 감시자와 연산변수
var wonInPocket: Int = 200 { //프로퍼티 감시자 구현
    willSet{
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double { //연산 변수
    get {
        return Double(wonInPocket) / 1000.0
    }
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니에서 달러를 \(newValue)달러로 변경 중입니다.")
    }
}


dollarInPocket = 3.5

//(1) dollarInPocket에 값 할당
//(2) dollarInPocket의 set 메서드 호출
//(3) set 메서드 속 첫 번째 실행문장 -> wonInPocket에 값 할당
//(4) wonInPocket의 프로퍼티 값 변경 직전 willSet 호출 : 주머니의 돈이 200원에서 3500원으로 변경될 예정입니다.
//(5) wonInPocket의 프로퍼티 값 변경 직후 didSet 호출 : 주머니의 돈이 200원에서 3500원으로 변경되었습니다.
//(6) dollarInPocket의 set 메서드 속 두 번째 실행문장 -> print(): 주머니에서 달러를 3.5달러로 변경 중입니다.


/*
 10.1.6 타입 프로퍼티
 각각의 인스턴스가 아닌 타입 자체에 속하는 프로퍼티
 타입 프로퍼티는 타입 자체에 영향을 미치는 프로퍼티이다.
 인스턴스의 생성 여부와 상관없이 타입 프로퍼티의 값은 하나며,
 그 타입의 모든 인스턴스가 공통으로 사용하는 값, 모든 인스턴스에서 공용으로 접근하고 값을 변경할 있는 변수 등을 정의할 때 유용하다.
 저장 타입 프로퍼티:
 변수 또는 상수로 선언할 수 있다. 반드시 초깃값을 설정해야 하며 지연 연산됩니다.
 지연 저장 프로퍼티와는 조금 다르게 다중 스레드 환경이라고 하더라도 단 한 번만 초기화된다는 보장을 받는다.
 연산 타입 프로퍼티:
 변수로만 선언할 수 있다.
 */

//10-12 타입 프로퍼티와 인스턴스 프로퍼티
/*
 인스턴스 프로퍼티
 이제까지 알아본 프로퍼티 개념은 모두 타입을 정의하고 해당 타입의 인스턴스가 생성되었을 때 사용할 수 있는 인스턴스 프로퍼티이다.
 인스턴스 프로퍼티는 인스턴스를 새로 생성할 때마다 초깃값에 해당하는 값이 프로퍼티의 값이 되고, 인스턴스마다 다른 값을 지날 수 있다.
 */
class AClass {
    
    //저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    //저장 인스턴스 프로퍼티
    var instansProperty: Int = 0 {
        didSet { //프로퍼티 감시자, didSet: 프로퍼티 값 변경 직후 호출
            //Self.typeProperty는
            //AClass.typeProperty와 같은 표현이다.
            Self.typeProperty = instansProperty + 100
        }
    }
    
    //연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {//접근자
            return typeProperty
        }
        set { //설정자
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123 //타입 프로퍼티는 인스턴스 생성 여부와 상관없이 타입 자체에 영향을 준다
//즉, 타입클래스에 값을 할당하면 모든 인스턴스의 해당 타입 프로퍼티의 값이 공통된 것이기 때문에 할당된 값과 동일하다.
//타입 프로퍼티는 각 인스턴스마다 구분되지 않고 하나이다

let classInstance: AClass = AClass() //인스턴스 생성
classInstance.instansProperty = 100 //인스턴스 프로퍼티는 각 인스턴스마다 다른 인스턴스로 구분된다.

print(AClass.typeProperty) //200
print(AClass.typeComputedProperty) //20

/*
 타입 프로퍼티는 인스턴스를 생성하지 않고도 사용할 수 있으며 타입에 해당하는 값입니다.
 그래서 인스턴스에 접근할 필요 없이 타입 이름만으로도 프로퍼티를 사용할 수 있습니다.
 */

//10-13 타입 프로퍼티의 사용
class Account1 {
    
    static let dollarExchangeRate: Double = 1000.0 //타입 상수
    
    var credit: Int = 0 //저장 인스턴스 프로퍼티
    
    var dollarValue: Double { //연산 인스턴스 프로퍼티
        get {
            //Self.dollarExchangeRate는
            //Account1.dollarExchangeRate와 같은 표현
            return Double(credit) / Self.dollarExchangeRate
        }
        set {
            //Self.dollarExchangeRate는
            //Account1.dollarExchangeRated와 같은 표현
            credit = Int(newValue * Account1.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

let instanceAccount1: Account1 = Account1()
instanceAccount1.dollarValue = 10
print(instanceAccount1.dollarValue)

/*10.1.7 키 경로
 프로퍼티도 프로퍼티의 위치만 참조하도록 할 수 있다. 바로 키 경로 key Path를 활용하는 방법이다.
 키 경로를 사용하여 간접적으로 특정 타입의 어떤 프로퍼티 값을 가리켜야 할지 미리 정해두고 사용할 수 있다.
 키 경로 타입은 AnyKeyPath라는 클래스로부터 파생된다.
 키 경로 타입인 WritableKeyPath<Root, Value>타입은 값 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우 적용한다,
 키 경로 타입인 ReferenceWritableKeyPath<Root, Value> 타입은 참조 타입, 즉 클래스 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우에 적용된다.
 키 경로는 역슬래시\와 타입, 마침표. 경로로 구성된다.
 \타입이름.경로.경로.경로
*/
//10-14 키 경로 타입의 타입 확인
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name)) //ReferenceWritableKeyPath<Person, String> 참조 타입(클래스 타입)에 키 경로 타입으로 읽고 쓸 수 있는 경우
print(type(of: \Stuff.name)) //WritableKeyPath<Stuff, String> 값 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우


/*
 10-15 키 경로 타입의 경로 연결
 키 경로는 기존의 키 경로에 하위 경로를 덧붙여 줄 수도 있다.
 appending(path:) 사용
 */
let keyPath = \Stuff.owner
print(type(of: keyPath)) //WritableKeyPath<Stuff, Person>
let nameKeyPath = keyPath.appending(path: \.name)

print(type(of: nameKeyPath)) //ReferenceWritableKeyPath<Stuff, String>
//-><root, value> 키 경로 타입은 value의 타입이 결정
//why, 키 경로를 할당 받은 상수나 변수가 value에 들어가는 프로퍼티 값을 가리킬테니깐!

/*
 10-16 keyPath 서브 스크립트와 키 경로 활용
 각 인스터스의 keyPath 서브스크립트 메서드에 키 경로를 전달하여 프로퍼티에 접근할 수 있다.
 */
class Person2 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff2 {
    var name: String
    var owner: Person2
}

let yh = Person2(name: "yh")
let haha = Person2(name: "haha")
let macbook = Stuff2(name: "macbook Pro", owner: yh)
var iMac = Stuff2(name: "iMac", owner: yh)
let iPhone = Stuff2(name: "iPhone", owner: haha)

let stuffNameKeyPath = \Stuff2.name
let ownerKeyPath = \Stuff2.owner
print(type(of: ownerKeyPath)) //WritableKeyPath<Stuff2 , Person2>

//\Stuff.owner.name과 같은 표현이 된다.
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)
print("ownerNameKeyPath의 타입은? \(type(of: ownerNameKeyPath))")//KeyPath<Stuff2, String> -> <root, value>

//키 경로와 서브 스크립트를 이용해 프로퍼티에 접근하여 값을 가져온다.
print(macbook[keyPath: stuffNameKeyPath]) //macbook Pro -> KeyPath<Stuff2, String>에서 String에 해당하는 값을 출력한다.
print(iPhone[keyPath: ownerNameKeyPath]) //haha -> KeyPath<Stuff2, String>에서 String에 해당하는 값을 출력한다.

//키 경로와 서브 스크립트를 이용해 프로퍼티에 접근하여 값을 변경합니다.
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"

print(iMac[keyPath: stuffNameKeyPath]) //iMac Pro -> ReferenceWritableKeyPath<Stuff, String>

//상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브 스크립트로도 값을 바꿔줄 수 없다.
