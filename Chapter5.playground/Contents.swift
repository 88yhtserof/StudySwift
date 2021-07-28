import UIKit

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
var result: Double = number.truncatingRemainder(dividingBy: 1.5) //나머지를 반환
print(result)
