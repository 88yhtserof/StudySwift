import UIKit

/*
 4-1 타입 안심과 타입 추론
 스위프트는 데이터 타입을 안심하고 사용할 수 있는 언어이다. Type-Safe
 컴파일 시 '타입 확인' 과정을 거쳐 오류를 알려준다.
 스위프트는 타입에 엄격하기 때문에 서로 다른 타입의 데이터 교환은 꼭 타입캐스팅(형변환)을 꼭 거쳐야 한다.
 타입 추론 : 스위프트에서는 변수나 상수를 선언할 때 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정한다.
 */
//타입을 지정하지 않았으나 타입추론을 통해 name은 String 타입으로 선언된다
var name = "88yhtserof"

/*
 4-2 타입 별칭
 기본 데이터 타입이든 사용자 데이터 타입이든 이미 존재하는 데이터 타입에 임의로 다른 이름(별칭)을 부여할 수 있다
그 후 기본 타입과 추가 별칭을 모두 사용할 수 있다.
 */
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100
var  year: YourInt = 2080

//MyInt도 YourInt도  Int 타입 이기 때문에 같은 타입으로 취급
year = age


 //4.3 튜플
/*
 4-3 튜플 기본
 튜플(Tuple) : 지정된 데이터 묶음
 */
//String, Int, Double 타입을 갖는 튜플
var person1: (String, Int, Double) = ("88yhtserof", 100, 200.5)

//인덱스를 통해서 값을 빼 올 수 있습니다.
print("이름: \(person1.0), 나이: \(person1.1), 신장: \(person1.2) person: \(person1) self: \(person1.self) ")

person1.1 = 99 //인덱스를 통해 값을 할당할 수 있다.
person1 = ("change", 150, 300.5) //요소를 한 번에 모두 바꿀 수 있다.

print(person1)

/*
 4-4 튜플 요소 이름 지정
 튜플 요소마다 이름을 붙여줄 수 있다.
 */
//String, Int, Double 타입을 갖는 튜플
var person2: (name: String, age:Int, height: Double) = ("88yhtserof", 100, 200.5)

//요소 이름을 통해서 값을 빼 올 수 있다.
print("이름: \(person2.name), 나이: \(person2.age), 신장: \(person2.height)")

person2.age = 199 //요소 이름을 통해 값을 할당할 수 있다.
person2.0 = "change" //인덱스를 통해서도 값을 할당할 수 있다.

print(person2)

/*
 4-5 튜플 별칭 지정
 타입 별칭을 사용하여 조금 더 깔끔하고 안정하게 코드를 작성할 수 있다.
 타입별칭(typealias) : 데이터 타입에 임의로 다른 이름을 부여할 수 있다.
 */
typealias PersonTuple = (name: String, age: Int, height: Double)

let jason: PersonTuple = ("Jason", 19, 100.6)
let swift: PersonTuple = ("Swift", 20, 200.5)

print("jason: \(jason)")
print("swift: \(swift.self)")
