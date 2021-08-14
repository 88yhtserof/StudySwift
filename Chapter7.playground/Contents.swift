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
