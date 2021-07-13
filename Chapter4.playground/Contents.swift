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

