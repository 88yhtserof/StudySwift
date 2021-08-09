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


//6.2 반복문
/*
 6.2.1 for-in 구문
 특정 구문을 특정 횟수만큼 반복해서 실행하고자 할 때 사용한다.
 정해진 반복 횟수, continue, break 등의 제어 키워드 사용 가능
 */
//6-15 for-in 반복 구문의 활용
for i in 0...2 {
    print(i)
}

for i in 0...5{
    if i.isMultiple(of: 2){//i가 주어진 값의 배수이면 true, 아니면 false
        print("\(i)는 짝수")
        continue //continue 키워드를 사용하면 바로 다음 시퀀스로 건너뛴다.
    }
    print("\(i)는 홀수")
}

//나)문자열은 순서가 있기 때문에 시퀀스 아이템으로 사용할 수 있다.
let helloSwift: String = "Hello Swift"

for char in helloSwift {
    print(char)
}

var result: Int = 1

//시퀀스에 해당하는 값이 필요없다면 와일드카드 식별자(_)를 사용하면 된다.
for _ in 1...3 {
    result *= 10
}

print("결과는 \(result)")

/*
 6-16 기본 데이터 타입의 for-in 반복 구문 사용
 for-in 구문은 스위프트의 기본 컬렉션 타입에서도 유용하게 사용할 수 있다.
 딕셔너리는 넘겨받는 값의 타입이 튜플로 지정되어 넘어옵니다.
 */
//Dictionary
//순서없는 키와 값 쌍 데이터 모음
let friends: [String: Int] = ["A": 35, "B": 29, "C":31]

for tuple in friends {
    print(tuple)
}

//키 값을 따로 나눠 받을 수도 있다.
let address: [String: String] = ["도": "충청북도", "시군구": "청주시 청원구", "동읍면":"율량동"]

for (key, value) in address {
    print("키는 \(key), 값은 \(value)")
}

//Set
//순서없는 데이터의 집합
let number:Set<Int> = [1, 2, 3, 4, 5]

for n in number {
    print("Set 원소 출력 - \(n)")
}

/*
 for-in 구문을 사용해 반복처리를 쉽게 할 수 있지만 스위프트에 좀 더 익숙해져서 옵셔널, 클로저 등을 배우고,
 함수형 프로그래밍 패러다임을 이해하면 for-in 구문보다 map,filter, flatMap 등을 더 많이 사용하게 될 것이다.
 */

/*
 6.2.2 while 구문
 주어진 조건식이 false가 될 때까지, 즉 반복횟수가 정해져 있지 않다.
 반복 횟수를 모를 때 사용
 continue, break 등의 제어 키워드 사용이 가능하다.
*/
//6-17 while 반복 구문의 사용
 var alphabet: [String] = ["A", "B", "C", "D"]

while !alphabet.isEmpty {
    print("이번에 삭제할 요소는? \(alphabet.removeFirst())")
    //removeFirst()는 첫 번째 요소를 삭제함과 동시에 삭제한 요소를 반환한다.
}

/*
 6.2.3 repeat-while 구문
 다른 프로그래밍 언어의 do-while 구문과 크게 다르지 않다
 repeat 블록의 코드를 최초 1회 실행한 후, while 다음의 조건이 성립하면 블로 내부의 코드를 반복 실행한다.
 */
//6-18 repeat-while 반복 구문의 사용
alphabet = ["a", "b", "c", "d"]

repeat {
    print("이번에 삭제할 요소는? \(alphabet.removeLast())")
    //removeLast()는 요소를 삭제함과 동시에 삭제한 요소를 반환한다.
}  while !alphabet.isEmpty

/*
 6.3 구문 이름표
 반복문 앞에 이름과 함께 콜론을 붙여 구문의 이름을 지정해주는 구문 이름표
 이름이 지정된 구문을 제어하고자 할 때는 제어 키워드와 구문 이름을 함께 써주면 좋다.
 */
//6-19 중첩된 반복문의 구문 이름표 사용
var numbers:[Int] = [0, 2, 3, 4, 100]

numbersLoop: for num in numbers {
    if num > 5 || num<1{
        continue numbersLoop
    }
    
    var count: Int = 0
    printLoop: while true {
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}
print("numbers엔 \(numbers)이 남는다.")
//2
//2
//numbers에 0, 2, 3, 4, 100 이 남는다.
