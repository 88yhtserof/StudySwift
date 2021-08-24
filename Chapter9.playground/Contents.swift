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

//9.2 클래스
//9.2.1 클래스의 정의
/*
 class 키워드 사용.
 클래스를 정의한다는 것은 새로운 타입을 생성해주는 것과 같다.
 클래스를 정의하는 방법은 구조체와 흡사. 다만 클래스는 상속 관계 가능
 */
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

/*
 9.2.2 클래스 인스턴스의 생성과 초기화
 구조체와 다르게 클래스의 인스턴스는 참조 타입이므로 클래스의 인스턴스를 상수 let 으로 선언해도 내부 프로퍼티 값을 변경 가능
 */
//9-4 Person 클래스의 인스턴스 생성 및 사요
var myInfo: Person = Person() //클래스 인스턴스 생성
myInfo.height = 200.3
myInfo.weight = 100.2
print("나의 키는 \(myInfo.height)이고, 나의 몸무게는 \(myInfo.weight)이다.")

let jenny: Person = Person()
jenny.height = 0.1
jenny.weight = 0.01
print("jenny의 키는 \(jenny.height)이고, jenny의 몸무게는 \(jenny.weight)이다.")


/*
 9.2.3 클래스 인스턴스의 소멸
 클래스의 인스턴스는 참조 타입이므로 더는 참조할 필요가 없을 때 메로메리에서 해제된다. 이 과정을 소멸이라 한다.
 클래스 내부에 deinit 메서드를 구현해주면 소멸되기 직전 deinit라는 메서드가 호출된다.
 deinit 메서드를 디이니셜라이저라고 부른다.
 deinit 메서드는 클래스당 하나. 매개변수와 반환값 소유 불가
 */
//9-5 Fruit 클래스의 인스턴스 생성 및 소멸
class Fruit {
    var color: String = ""
    var name: String = ""
    
    deinit {
        print("Fruit 클래스의 인스턴스가 소멸된다.")
    }
}

var myFruit: Fruit? = Fruit()
myFruit = nil //deinit 메서드 호출

//9.3 구조체와 클래스의 차이
/*
 구조체 -  값 타입. 전달 인자로 값 타입의 값을 넘긴다면 전달될 값이 복사되어 전달
 클래스 -  참조 타입. 참조 타입이 전달인자로 전달될 때는 값을 복사하지 않고 참조(주소) 전달
 차이점
 1. 클래스는 상속 관계 가능
 2. 타입캐스팅은 클래스의 인스턴스에만 허용
 3. 디이니셜라이저는 클래스의 인스턴스에만 활용 가능
 참조 횟수 계산은 클래스의 인스턴스에만 적용
 */
//9-6 값 타입과 참조 타입의 차이
struct BasicInfoMation {
    let name: String
    var age: Int
}
var minaInfo: BasicInfomation = BasicInfomation(name: "Mina", age: 99)
minaInfo.age = 100

//minaInfo의 값을 복사하여 할당(값 타입이니깐)
var friendInfo: BasicInfomation = minaInfo

print("minaInfo : \(minaInfo.age)")
print("friendInfo : \(friendInfo.age)")

friendInfo.age = 200
print("minaInfo : \(minaInfo.age)")
print("friendInfo : \(friendInfo.age)")
//friendInfo는 값을 복사해온 것이기 때문에 minaInfo와 별개

class Friend {
    var name: String = ""
    var number: Int = 0
}

var sandra: Friend = Friend()
var friendsandra: Friend = sandra  //jenny의 참조(주소)를 할당

print("sandra's number : \(sandra.number)")
print("friend's number : \(friendsandra.number)")

sandra.name = "sandra"
sandra.number = 433
print("sandra's number : \(sandra.number)")
print("friend's number : \(friendsandra.number)")
//friendsandra는 jenny를 참조하기 때문에 jenny의 값만 변경하여도 friendsandra도 변경된다.

/*
 9-7 식별 연산자 사용
 클래스의 인스터스끼리 참조가 같은지 확인할 때는 식별 연산자를 사용한다.
 */
var anotherFriend: Friend = Friend()

print("sandra와 friendsandra의 참조가 같은가? \(sandra === friendsandra)")
print("sandra와 anotherFriend의 참조가 같은가? \(sandra === anotherFriend)")

/*
 9.3.2 스위프트의 기본 데이터 타입은 모두 구조체
 스위프트의 다른 기본 타입은 모두 구조체로 구현되어 있다. 즉, 값 타입이라는 뜻
 */

/*
 9.4 구조체와 클래스 선택해서 사용하기
 구조체와 클래스는 새로운 데이터 타입을 정의하고 기능을 추가한다는 점이 같지만 구조체는 값 타입, 클래스는 참조 타입으로 용도가 다르다.
 프로젝트 성격에 따라, 데이터의 활용도에 따라, 특정 타입을 구현할 때 구조체와 클래스 중 하나를 선택해야 한다,
 */
