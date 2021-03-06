import UIKit

/*
 띄어쓰기와 연산자
 스위프트에서는 띄어쓰기도 중요한 문법 중 하나. 어디에 공백이 있는지도 중요하다.
 */

//산술 연산자
let value1: Int = 2
let value2: Int = 10
let value3: Int = 3

print(value1+value2)
print(value1-value2)
print(value1*value2)
print(value2/value1) //나눈 값(몫) 반환
print(value2%value3)  //나머지 반환

/*
 NOTE_스위프트의 나머지 연산과 나누기 연산자
 스위프트에서는 부동소수점 타입의 나머지 연사까지 지원한다.
 스위프트는 데이터 타입에 굉장히 엄격하므로 서로 다른 자료형끼리의 연산을 엄격히 제한한다. Int와 Double 연산 안 됨
 */
let number: Double = 5.0
var result1: Double = number.truncatingRemainder(dividingBy: 1.5) //나머지를 반환
print(result1)
/*
 result = number % 1.5 -> 에러
 부동 소수점의 경우 '%' 연산자 대신 truncatingRemainder을 사용한다.
 */

let result2 = number / 1

print("결과 값: \(result2), 타입: \(type(of: result2))")

//비교 연산자
/*
 A === B 참조가 같다.
 A !== B 참조가 같지 않다.
 A ~= B 패턴 매치되는지 확인하여 불리언 값 반환
 
 스위프트의 유일한 참조 타입인 클래스의 인스턴스에서만 참조 비교 연산자를 사용할 수 있다.
 */
let valueA: Int = 3
let valueB: Int = 5
let valueC: Int = 5

let isSameValueAB: Bool = valueA == valueB //false
let isSameValueBC: Bool = valueB == valueC //true

/*
let referenceA: SomeClass  = SomeClass()
let referenceB: SomeClass  = SomeClass()
let referenceC: SomeClass  = referenceA
 
let isSameReferenceAB: Bool = referenceA === referenceB //false
let isSameReferenceAC: Bool = referenceA === referenceC //true
*/

//5.1.4 삼항 조건 연산자
/*
 5-1 삼항 조건 연산자의 사용
 피연산자가 3개인 삼항 조건 연산자.
 조건 ? A : B - 참이면 A를 반환, 거짓이면 B를 반환
 조건 안에 또 다른 삼항 연산자를 넣어 중첩할 수도 있다.
 
 띄어쓰기 주의*
 */
let valueD: Int = 3
let valueE: Int = 5
var compareValue: Int = valueD > valueE ? valueD : valueE // 5

let strValue: String = "value"
compareValue = strValue.isEmpty ? 0:1 //1
strValue.isEmpty ? print("아무 내용도 없습니다.") : print(strValue)

//5.1.5 범위 연산자
//범위 연산자는 1씩 증가하기 때문에 정수만 가능하다.
//폐쇄 범위 연산자
for i in 0...5 { //i가 0,1,2,3,4,5로 1씩 증가한다.
    print("\(i). 폐쇄 범위 연산자")
}

//반폐쇄 범위 연산자
for i in 0..<5 { //i가 0,1,2,3,4로 1씩 증가한다.
    print("\(i). 반폐쇄 범위 연산자")
}

var array = ["A", "B", "c", "d"]

//단방향 범위 연산자
for value in array[2...] {//인덱스 2부터 배열 끝까지 배열 원소가 value에 저장됨
    print("\(value). 단방향 범위 연산자1")
}

for value in array[..<2] { //인데스 0부터 1까지 배열 원소가 value에 저장됨
    print("\(value). 단방향 범위 연산자2")
}

for value in array[...2] { // 인덱스 0부터 2까지 배열 원소가 value에 저장됨
    print("\(value). 단방향 범위 연산자3")
}

//5.1.10 기타 연산자
/*
 nil 병합 연산자 A ?? B
 : A가 nil이 아니면 A를 반환하고, A가 nil이면 B를 반환한다.
 nil 병합 연산자는 옵셔널을 사용할 때 아주 유용한 연산자이다.
 삼항 조건 연산자을 사용하여 nil 여부를 확인할 수도 있지만 nil 병합 연산자를 사용하는 것이
 훨씬 안전하고 간단하게 옵셔널을 다루는 방법이다.
 
 let value: Int = someOptionalInt != nil ? someOptionalInt : 0
 
 let value: Int = someOptionalInt ?? 0
*/

/*
 부호 변경 연산자 -A
 A(수)의 부호를 변경합니다.
 */
