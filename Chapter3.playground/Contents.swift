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
