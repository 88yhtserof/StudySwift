import UIKit

/*
 구조체와 클래스
 : 프로그래머가 데이터를 용도에 맞게 묶어 표현하고자 할 때 유용하다.
   프로퍼티와 메서드를 사용하여 구조화된 데이터와 기능을 가질 수 있다. 하나의 새로운 사용자 정의 데이터 타입으로 만들어 주는 것이다.
   스위프트에서는 이 둘의 모습과 문법이 거의 흡사
 차이:구조체의 인스턴스는 값 타입, 클래스의 인스턴스는 참조 타입
 (지금까지 배운 스위프트의 데이터 타입과 열거형은 모두 값 타입)
 소스파일 하나에 여러 개의 구조체와 여러 개의 클래스를 정의하고 구현 가능. 중첩 타입의 정의 및 선언 가능
 */

//9.1 구조체

//9.1.1 구조체 정의
//구조체는 struct 키워드로 정의한다.
//구조체를 정의한다는 것은 새로운 타입을 생성해주는 것과 같다.
//9-1 BasicInfomation 구조체 정의
struct BasicInfomation {
    var name: String
    var age: Int
}

//9.1.2 구조체 인스턴스의 생성 및 초기화
//9-2 BasicInformation 구조체의 인스턴스 생성 및 사용

//프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성한다.
var yhInfo: BasicInfomation = BasicInfomation(name: "yh", age: 100)
yhInfo.name = "hy" //var로 선언되는 경우 값을 변경해줄 수 있다.
print("내 이름은 \(yhInfo.name)")