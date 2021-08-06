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
