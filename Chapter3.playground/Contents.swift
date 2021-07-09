import UIKit

/*
 3-1 Int 와 Unit
 */
var integer:Int = -100
let unsignedInteger:UInt = 50 //Unit 타입에는 음수값을 할당할 수 없습니다.
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")

let largeInteger:Int64 = Int64.max //let은 상수 생성 시 사용
let smallUnsignedInteger:UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")

//let tooLarge: Int=Int.max+1 Int의 표현 범위가 초과하므로 오류를 냅니다.
//let cannotBeNagetive:UInt = -5 UInt는 음수가 될 수 없으므로 오류를 낸다

//integer =unsignedInteger 스위프트에서 Int와 UInt는 다른 타입이다
integer = Int(unsignedInteger) //Int타입으로 형변환 뒤 할당해 주어야 한다.
print(integer)

/*
 3-2 진수별 정수 표현
 */
let decimalInteger:Int = 28 //10진수
let binaryInteger: Int = 0b11100 //2진수로 28 표현, 0b사용
let octalInteger: Int = 0o34 //8진수로 28 표현, 0o 사용
let hexadecimalInteger: Int = 0x1C // 16진수로 28 표현, 0x 사용

/*
 3-3 Bool
 */
var boolean: Bool = true
print("boolean 값: \(boolean)")
boolean.toggle() //true - fasle 반전
print("toggle()한 boolean 값: \(boolean)")

let iLoveYou:Bool = true //let은 상수 생성 시 사용
let isTimeUnlimited: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimited)")

/*
3-4 Float과 Double
 */
//Float: 32bits의 부동소수 표현 / Double: 64bits의 부동소수 표현
//Float이 수용할 수 있는 범위를 넘어설 때, 자신의 감당할 수 있는 만큼만 남긴다.->정확도가 떨어짐
var floatValue: Float = 1234567890.1

let doubleValue: Double = 1234567890.1

print("floatValue: \(floatValue) doubleValue : \(doubleValue)")
/*
 e5=10의 5 제곱=100000
 e-5=10의 5분의 1 제곱=0.00010
*/
 
//Float이 수용할수 있는 범위의 수로 변경합니다.
floatValue = 123456.1
print(floatValue)

/*
 3-5 Character
 */
let alphabet: Character = "A"
print(alphabet)
//영어 및 유니코드에서 지원하는 모든 언어 및 특수기호 등을 사용할 수 있다.

