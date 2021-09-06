import UIKit

/*
 옵셔널:
 스위프트의 특징 중 하나인 안전성을 문법으로 담보하는 기능
 선택적인, 즉 있을 수도 없을 수도 있음 -> 변수 또는 상수의 값이 nil일 수도 있다
 옵셔널과 옵셔널이 아님 값은 엄격하게 다른 타입으로 인식
 옵셔널 몁수 또는 상수만 nil을 할당할 수 있다.
 */

//8-2 옵셔널 변수의 선언 및 nil 할당
var myName: String? = "88yhtserof" //?를 붙여 옵셔널 변수임을 표현한다.
print(myName)
//옵셔널 타입의 값을 print 함수를 통해 출력하면 Optional("88yhtserof")라고 출력도는 것이 정상.

myName = nil
print(myName)

/*
 옵셔널은 제네릭이 적용된 열거형이다. 옵셔널이 값을 갖는 케이스와 그렇지 못한 케이스 두 가지로 정의되어있다.
 nil일 때는 nom 케이스, 값이 있는 경우는 some 케이스이다.
 옵셔널 자체가 열거형이기 때문에 옵셔널 변수는 switch 구문을 통해 값이 있고 없음을 확인할 수 있다.
 하지만 switch 구문으로 통해 매번 값 유무를 판단하는 것은 불편하고 안전하지 못하다.
 */

//8.2 옵셔널 추출
/*
 옵셔널 추출 Optional Unwrapping
 열거형 some 케이스에 할당된 옵셔널의 값을 옵셔널이 아닌 값으로 추출하는 옵셔널 추출
 */

/*
 8.2.1 강제 추출
 옵셔널 강제 추출 Force Unwapping
 가장 간단하지만 런타임 오류가 날 수도 있다. 게다가 옵셔널의 목적인 안전성을 상실하는 방법이다.
 !로 강제 추출을 할 수 있다.
 런타임 오류의 가능성을 항상 내포하기 때문에 옵셔널 강제 추출 방식 사용 지양해야 한다.
 */
//8-6 옵셔널의 강제 추출
var name: String? = "88yhtserof"

var yhtserof: String = name!
print(yhtserof)
//옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 따라서 추출 후 할당해주어야 한다.
//이때 name이 nil일 경우 런타임 오류 발생

//if 구문 등 조건문을 사용해서 조금 더 안전하게 처리할 수 있다.
if name != nil {
    print("my name is \(name)")
}else {
    print("myName == nil")
}


/*
 8.2.2 옵셔널 바인딩 Optional Binding
 옵셔널 바인딩은 옵셔널에 값이 있는지 확인할 때 사용한다.
 만약 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할 수 있도록 해준다.
 옵셔널 if 또는 while 구문 등과 결합하여 사용 가능
 */
//8-7 옵셔널 바인딩을 사용한 옵셔널 값의 추출
var myWord: String? = "cat"

//옵셔널 바인딩을 통한 임시 상수 할당
if let word = myWord {
    print("단어는? \(word)")
}else {
    print("단어는? nil")
}

myWord = nil
//옵셔널 바인딩을 통한 임시 변수 할당
if var word = myWord {
    word = "dog" //변수이므로 내부에서 변경 가능
    print("단어는? \(word)")
}else {
    print("단어는? nil")
}

/*
 8-8 옵셔널 바인딩을 사용한 여러 개의 옵셔널 값의 추출
 옵셔널 바인딩을 통해 한 번에 여러 옵셔널 값을 추출할 수도 있다. 단 바인딩하려는 옵셔널 중 하나라도 값이 없다면 해당 블록 내부의 명령문은 실행되지 않는다.
 */
var bestFriend: String? = nil
var myBestName: String? = "Mina"

//nil이 할당되어 있기 때문에 friend에 옵셔널이 바인딩되지 않으므로 실행되지 않는다.
if let name = myBestName, let friend = bestFriend {
    print("We are friend! \(name) & \(friend)")
}

bestFriend = "Ell"
if let name = myBestName, let friend = bestFriend {
    print("We are friend! \(name) & \(friend)")
}

/*
 8.2.3 암시적 추출 옵셔널
 암시적 추출 옵셔널 Implicitly Unwrapped Optionals
 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직 상 nil때문에 런타임 오류가 발생하지 않을 것 같다는 확신이 들 때 사용
 but 이것 또한 옵셔널이기 때문에 nil을 할당해 줄 수 있고, 런타임 오류도 발생할 가능성이 있으므로 사용 지양
 */


//블로그 정리

//옵셔널이란?
//var 변수명: 데이터타입? = 값

var introduce: String? = "Hi! I am yh!"
print(introduce)
//출력 Optional("Hi! I am yh!")

introduce = nil
print(introduce)
//출력 nil

/*
 public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
 
    public init(_ some: Wrapped)
    ...
 }
 */

//옵셔널 추출

//옵셔널 강제 추출
let number1: Int? = 2
let number2: Int = number1!

print(number1) //옵셔널
print(number2) //옵셔널의 값을 추출한 값
//Optional(2)
//2

//옵셔널 바인딩
var myTitle: String? = "7월 여름 휴가"
var myContent: String? = "여름 휴가로 제주도에 놀러가기로 했다."

if let title = myTitle, var content = myContent {
    //변수이므로 내부에서 변경이 가능하다.
    content = title + "\n" + content
    print(content)
} else {
    print("nil")
}

/*
 출력
 7월 여름 휴가
 여름 휴가로 제주도에 놀러가기로 했다.
 */

//암시적 추출 옵셔널
let str1: String! = "yh"
print(str1)
//Optional("yh")

let str2: String = str1
print(str2)
//yh
