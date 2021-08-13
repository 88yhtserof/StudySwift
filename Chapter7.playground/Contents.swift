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
