import UIKit

/*
 함수
 함수는 작업의 가장 작은 단위이자 하나의 프로그램
 스위프트에서 함수는 일급객체이기 때문에 하나의 값으로 사용 가능
 스위프트에서 함수는 자유도가 높다.
 오버라이드, 오버로드 가능
 - 매개변수의 타입이 다르면 같은 이름의 함수를 여러 개 만들 수 있고, 매개변수의 개수가 달라도 같은 이름의 함수를 만들 수 있다.
 */

//7.2.1 기본적인 함수의 정의와 호출
/*
 매개변수parameter 함수를 정의할 때 외부로 받아들이는 전달 값의 이름
 전달인자Argument 함수를 실제로 호출할 때 전달하는 값
 */
func hello(name: String) -> String {
    return "Hello \(name)"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func introduce(name: String) -> String {
    "제 이름은 " + name + "입니다."
    /*
 return 키워드는 함수 내부의 코드가 단 한 줄의 표현이고, 그 표현의 결곽값의 타입이 함수의 반환 타입과 일치한다면 생략 가능하다.
 */
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)


//7.2.2 매개변수

//7-2 매개변수가 없는 함수 정의와 사용
func helloWorld() -> String {
    return "Hello, world!"
}
print(helloWorld())

//7-3 매개변수가 여러 개인 함수의 정의와 사용
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "88yhtserof", yourName: "Jenny"))

//7-4 매개변수 이름과 전달인자 레이블을 가지는 함수 정의와 사용
func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello(from: "88yhtserof", to: "John"))

//7-5 전달 인자 레이블이 없는 함수 정의와 사용
func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello "
    }
    
    return result + name + "!"
}

print(sayHello("JoJo", 3))

/*
 7-6 전달인자 레이블 변경을 통한 함수 중복 정의
 전달인자 레이블을 변경하면 함수의 이름 자체가 변경된다.
 그렇기 때문에 전달인자 에이블만 다르게 써주더라도 함수 중복 정의(오버로드)로 동작할 수 있다.
 */
func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello(to: "JOJO", 2))
print(sayHello(to: "John", repeatCount: 4))

//7-7 매개변수 기본 값이 있는 함수의 정의와 사용
/*
 스위프트 함수에서는 매개변수마자 기본 값을 지정할 수 있다.
 매개변수 기본값이 있는 함수는 함수를 중복 정의한 것처럼 사용할 수 있다. 즉, 하나의 함수로 한 파라미터만 가진 함수, 두 개의 파라미터를 가진 함수를 사용할 수 있다.
 주로 기본 값이 없는 매개변수가 앞에 위치한다. 기본값이 없는 매개변수는 대체로 중요한 값을 전달할 가능성이 높다. 무엇보다도 기본값이 있는지와 상관없이 중요한 매개변수는 앞쪽에 위치하는 것이 좋다.
 */
func sayHello(_ name: String, times: Int = 2) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + "ye "
    }
    
    return result
}

print(sayHello("JOO", times: 3))
print(sayHello("KOO"))

/*
 7-8 가변 매개변수를 가지는 함수의 정의와 사용
 매개변수로 몇 개의 값이 들어올지 모를 때 가변 매개변수를 사용할 수 있다.
 0개 이상의 값을 받아올 수 있으며, 가변 매개변수로 들어온 인자 값은 배열처럼 사용 가능
 1 함수 1 가변 매개변수
 */
func sayHelloToFriends(me: String, friends names: String... ) -> String {
    var result: String = ""
    
    for friend in names{
        result += "Hello \(friend)! "
    }
    
    result += "I'm "+me + "!"
    
    return result
}

print(sayHelloToFriends(me: "88yhtserof")) //가변 매개변수는 0개 이상의 값을 받아올 수 있다.
print(sayHelloToFriends(me: "88yhtserof", friends: "Jay", "John", "Harry"))

//7.2.3 반환이 없는 함수
//7-10 반환 값이 없는 함수의 정의와 사용
func sayHelloWorld() {
    print("Hello World!")
}

sayHelloWorld()

//Void를 명시해 주어도 된다.
func sayGoodbye() -> Void {
    print("Goodbye")
}

sayGoodbye()


//7.2.4 데이터 타입으로서의 함수
/*
 7-11 함수 타입의 사용
 (매개변수의 타입 나열) -> 반환 타입
 스위프트의 함수는 일급 객체이므로 하나의 데이터 타입으로 사용할 수 있다.
 함수를 데이터 타입으로 사용할 수 있다는 것은 함수를 전달인자로 받을 수도, 반환 값으로 돌려줄 수도 있다는 의미
 */
typealias CalculateTwoInts = (Int, Int) -> Int //타입 별칭 사용

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a+b
}

var mathFunction: CalculateTwoInts = addTwoInts
//var mathFunction: (Int, Int) -> Int = addTwoInts 와 동일한 표현

print(mathFunction(2, 5))

//7-12 전달인자로 함수를 전달하는 함수
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 2, 4)


//7-13 특정 조건에 따라 적절한 함수를 반환해주는 함수
func chooseMathFunction(_ toAdd: Bool)  -> CalculateTwoInts {
    return toAdd ? addTwoInts : addTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)

/*
 전달인자 레이블과 함수 타입
 전달인자 레이블은 함수 타입을 작성할 때 사용 불가
 let someFunction: (_ a: Int, _ b: Int) ->I nt 가능
 let someFunction: (a: Int, b: Int) -> Int 가능
 */


//7.3 중첩 함수
/*
 스위프 데이터는 타입의 중첩은 자유롭다.
 클래스 안 클래스, 열거형 안 열거형
 */
//7-14 원점으로 이동하기 위한 함수
//원점은 0
typealias MoveFunc1 = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionForMove1(_ shouldGoLeft: Bool) -> MoveFunc1 {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3 //현재 위치

//현 위치가 0보다 크므로 전달되는 인자 값은 true가 됩니다
//그러므로 goLeft 함수가 할당될 것이다
let moveToZero1: MoveFunc1 = functionForMove1(position>0)
/*
 let moveZero: (Int) -> Int = functionForMove1(position>0) 와 같은 의미
 즉 moveZero는 Int를 매개변수로 받고 Int를 반환한다.
 */

print("원점으로 갑시다.")

//원점에 도착하면(현 위치가 0이면) 반복문이 종료된다.
while position != 0 {
    print("지금 위치는 \(position)")
    position = moveToZero1(position)
    /*
     position = moveToZero(position) 의 처리 과정
     1. functionForMove(position>0) 실행
     2. 만약 position > 0 이 true라면 goLeft 호출됨
     3. currentPosition - 1 이 반환된다.
     */
}
print("원점 도착!")

/*
 지금 위치는 3
 지금 위치는 2
 지금 위치는 1
 */

//7-15 중첩 함수의 사용
typealias MoveFunc2 = (Int) -> Int

func functionForMove2(_ shouldGoLeft: Bool) -> MoveFunc2 {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }

    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var index: Int = -4 //현 위치

let moveToZero2: MoveFunc2 = functionForMove2(index > 0)

while index != 0 {
    print("지금 위치는 \(index)")
    index = moveToZero2(index)
}
print("원점 도착")


//7.4 종료되지 않는 함수
/*
 스위프트에는 종료(return)되지 않는 함수가 있다.
 종료되지 않는다는 의미는 정상적으로 끝나지 않는 함수라는 뜻이다.
 비반환 함수 또는 비반환 메서드라고 한다,
 비반환 함수 안에서는 오류를 던진다든가, 중대한 시스템 오류를 보고 하는 등의 일을 하고 프로세스를 종료해 버리기 때문이다.
 */

//7-16 비반환 함수의 정의와 사용
func crashAndBurn() -> Never {
    fatalError("Something vary, vary bad happened")
}

//crashAndBurn() //프로세스 종료 후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true) //All is well
//someFunction(isAllIsWell: false) //마을에 도둑이 들었습니다!

//7.5 반환 값을 무시할 수 있는 함수
//7-17 @discardableResult 선언 속성 사용
func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}

//반환 값을 사용하지 않았으므로 컴파일러가 경고를 표시할 수 있다.
say("hello")

//반환값을 사용하지 않을 수 있다고 미리 알렸기 때문에 반환 값을 사용하디 않아도 컴파일러가 경고하지 않는다.
discardableResultSay("bye")



//블로그 정리

/*
func 함수이름(전달인자레이블 매개변수: 매개변수타입) -> 반환타입 {
    
    실행구문
    return 반환값
}
 */

//return 키워드 생략
func sayHello() -> String {
    "Hello!"
    //return "Hello!"와 같은 동작
}
print(sayHello())

//매개변수와 전달인자, 전달인자 레이블
func sendLetter(from myName: String,
                to yourName: String,
                _ content: String) -> String {
    return "Dear \(yourName),\n \(content) \n \(myName)"
}

var letter:String = sendLetter(from: "yh", to: "renee", "Hello!")
print(letter)

//매개변수의 기본값
//중요한 매개변수는 앞쪽에 배치하는 것이 좋다.
//기본값이 없는 매개변수는 주로 중요한 값을 전달할 가능성이 높다. 따라서 기본 값이 없는 매개변수를 앞에 배치한다.
func sendLetter(from myName: String,
                _ content: String,
                to yourName: String = "my friend") -> String {
    return "Dear \(yourName),\n \(content) \n \(myName)"
}

letter = sendLetter(from: "88yh", "Hi!!")
print(letter)

letter = sendLetter(from: "john", "Nice to meet you!", to: "Mina")
print(letter)

//가변 매개변수
func sayFavoriteList(favoriteList: String...) {
    for favorite in favoriteList {
        print("I Love \(favorite)")
    }
}

sayFavoriteList(favoriteList: "LaLaLand", "blue", "purple")


//일급객체, 함수
func isEvenNumber(_ number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    }
    return false
}

print(isEvenNumber(2))

let function1: (Int) -> Bool = isEvenNumber

print(function1(5))

//타입 별칭을 사용하여 나타낼 수도 있다.
typealias CheckInt = (Int) -> Bool
let function2: CheckInt = isEvenNumber

print(function2(10))


//전달인자가 함수인 경우
func sayResult(_ number:Int, function: (Int) -> Bool) {
    if function(number) {
        print("\(number)는 짝수입니다.")
    }else{
        print("\(number)는 홀수입니다.")
    }
}

sayResult(10, function: isEvenNumber)
