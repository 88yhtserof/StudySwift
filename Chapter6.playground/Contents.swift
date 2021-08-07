import UIKit

/*
 Chapter6 흐름제어
 스위프트의 흐름 제어 구문은 소괄호는 생략 가능하지만 중괄호는 생략할 수 없다
 */

/*
 if 구문
 스위프트의 if 구문은 조건의 값이 꼭 Bool 타입이어야 한다.
 */
//6-1 if 구분 기본 구현
var first: Int = 5
var second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first > second")
} else {
    print("first == second")
}


/*
 6-2 if 구문의 다양한 구형(소괄호가 없는 코드)
 조건을 충족해 블록 내부의 명령문이 실행되면
 그다음에 이어진 else if의 조건을 충족하더라도 실행되지 않고 조건문을 빠져나온다.
 */
first = 5
second = 5
var biggerValue: Int = 0

if first > second {
    biggerValue = first
} else if first == second {
    biggerValue = first
} else if first < second {
    biggerValue = second
} else if first == 5 {
    /*
     조건을 충족하더라도 이미 앞에 위치한 조건을 충족해 위에서 실행 후 조건문을 빠져나왔다.
     따라서 이 조건문은 실행되지 않는다.
     */
    biggerValue = 100
}
//else나 else if 없이 if문만 단독으로 사용할 수도 있다.
print("biggerValue : \(biggerValue)")

//6.1.2 switch구문
//6-3 switch 구문 기본 구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:  //범위 연산자 사용 가능
    print("Value == 1~10")
    fallthrough                       //다음 case도 실행하도록 하는 키워드
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break //break은 선택 사항
default:
    print("10 < Value <= 100")
}

//6-4 부동소수 타입의 범위 연산을 통한 switch case 구성
let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("Value == zero")
case 1.5...10.5:
    print("1.5 < = Value <=10.5")
default:
    print("Value == \(doubleValue)")
}

//6-5 문자열 switch case 구성
let stringValue: String = "Liam Neeson"

switch stringValue {
case "88yhtserof":
    print("value is 88yhtserof")
case "renee":
    print("value is renee")
case "A", "b", "c":
    print("value is A or b or c")
default:
    print("default: \(stringValue)")
}

//6-7 fallthrough의 사용
switch stringValue {
case "88yhtserof":
    print("value is 88yhtserof")
case "A":
    print("value is A")
case "Joy":
    /*
     case에 실행 구문이 없으면 컴파일 오류가 발생한다.
     하지만 fallthrough 키워드가 있으면 그 다음 case가 연이어 실행되기 때문에 오류가 발생하지 않는다.
     */
    fallthrough
case "Liam Neeson":
    fallthrough
case "Jey":
    print("value is \(stringValue)")
default:
    print("Not Find")
    /*
비교될 값이 명확히 한정적인 값(열거값 등)이 아닌 경우 default를 꼭 작성해줘야 한다.
 */
}

//6-8 튜플 switch case 구성
typealias NameAge = (name:String, age: Int) //타입 별칭 사용

var tupleValue: NameAge = ("88yhtserof", 100)

switch tupleValue {
case("88yhtserof", 100):
    print("정답입니다.")
default:
    print("Not Find")
}

/*
 6-9 와일드 카드 식별자를 사용한 튜플 switch case 구성
 와일드 카드 식별자(_)
 튜플은 와일드카드 식별자와 함께 사용하면 유용하다
 */
tupleValue = ("88yhtserof", 1000)

switch tupleValue {
case ("88yhtserof", 100):
    print("정답입니다.")
case ("88yhtserof", _):
    print("이름만 맞았습니다. 나이는 \(tupleValue.age)")
case (_, 100):
    print("나이만 맞았습니다. 이름은 \(tupleValue.name)")
default:
    print("Not Find")
}

/*
 6-10 값 바인딩을 사용한 튜플 switch case 구성
 let 을 붙인 값 바인딩을 사용한다.
 */
switch tupleValue {
case ("88yhtserof", 100):
    print("정답입니다.")
case ("88yhtserof", let age):
    print("이름만 맞았습니다. 나이는 \(age)")
case (let name, 100):
    print("나이만 맞았습니다. 이름은 \(tupleValue.name)")
default:
    print("Not Find")
}

//6-11 where를 사용하여 switch case 확장
//where에 대한 문법은 나중에 다룸
let position: String = "사원"
let year: Int = 1
let isIntern: Bool = false

switch position {
case "사원" where isIntern == true:
    print("인턴입니다.")
case "사원" where year < 2 && isIntern == false:
    print("신입사원입니다.")
case "대리":
    print("대리입니다.")
default:
    print("사장")
}

/*
 6-12 열거형을 입력 값으로 받는 switch 구문
 열거형과 같이 한정된 범위의 값을 입력 값으로 받게 될 때, 값에 대응하는 각 case를 구현한다면 default를 구현하지 않아도 된다.
 */
enum Fruit {
    case apple, orange, banana
}

let myfavoriteFruit: Fruit = Fruit.apple

switch myfavoriteFruit {
case .apple:
    print("내가 가장 좋아하는 과일은 사과이다.")
case .orange:
    print("내가 가장 좋아하는 과일은 오렌지이다.")
case .banana:
    print("내가 가장 좋아하는 과일은 바나나이다.")
}


/*
 6-14 차후에 Menu 열거형에 추가한 case를 처리하지 않으면 경고를 내어줄 unknown 속성
 나중에 열거형에 case를 추가하면 기존의 switch 구문은 컴파일 오류가 발생할 것이다.
 case _ 은 default 와 같은 의미이다.
 unknown 속성을 부여할 수 있는 case는 case_ 또는 default case 뿐이다.
 또 unknown 속성을 부여한 case는 switch 구문의 가장 마지막 case로 작성해야한다.
 */
enum Menu {
    case chicken
    case pizza
    case hamburger
    case rice
}
let lunchMenu: Menu = .rice

switch lunchMenu {
case .chicken:
    print("치킨 주문")
case .hamburger:
    print("햄버거 주문")
case .pizza:
    print("피자 주문")
//@unknown default:
//    print("오늘 뭐 먹지?")
@unknown case _:
    print("무엇을 주문할까?")
}

