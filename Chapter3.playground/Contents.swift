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

/*
 3-6 String
 */
let name:String = "88yhtserof"

//이니셜라이저를 사용하여 빈 문자열 생성 가능
var introduce: String = String()

//append() 문자열 이어붙이기
introduce.append("제 이름은")

//+ 연산자를 통해서도 문자열을 이어붙일 수 있다.
introduce = introduce + " " + name + " 입니다."
print(introduce)

//String.count() 메소드는 문자의 수를 반환한다.
print("name의 글자 수: \(name.count)")

//String.isEmpty 메소드로 빈 문자열인지 아닌지 확인할 수 있다.
print("intoduce 가 비어있습니까?: \(introduce.isEmpty)")

//유니코드의 스칼라값을 사용하면 값에 해당하는 표현이 출력된다.
let unicodeScalarValue: String = "\u{2665}"
print(unicodeScalarValue)

/*
 3-7 String 타입의 다양한 기능
 */
let language:String = "88yhtserof"
var result:String = "Hello, "
print(result)

//1. + 연산자를 통한 문자열 결합
result+=language
result+="!"
print(result)

//2. 연산자를 통한 문자열 비교
var isSameString:Bool = false
isSameString = language == "88yhtserof"
print(isSameString)

//3. 접두어, 접미어 확인
var hasPrefix:Bool  = false
hasPrefix = language.hasPrefix("88")
print(hasPrefix)  //true

var hasSuffix:Bool = false
hasSuffix = language.hasSuffix("88")
print(hasSuffix) //false

//4.대소문자 변환
let testUpperLower:String = "abcdEFG"
var convertedString: String = ""
convertedString = testUpperLower.uppercased()
print(convertedString) //ABCDEFG

convertedString = testUpperLower.lowercased()
print(convertedString)  //abcdefg

// 5. 프로퍼티를 통한 빈 문자열 확인
print(language.isEmpty) //false

//6. 프로퍼티를 이용한 문자열 길이 확인
print(language.count) //10

//7. 코드 상에서 여러 줄의 문자열을 직접 쓰고 싶다면 큰따옴표 세 개를 사용한다.
print("""
    1. +연산자와 append() 메소드로 문자열을 이을 수 있다.
    2. 비교 연산자를 통해 문자열을 비교할 수 있다.
    3. hasPrefix()로 접두어를, hasSuffix로 접미어를 확인할 수 있다.
    4. uppercased()와 lowercased로 대소문자 변환할 수 있다.
    5. String.isEmpty 로 빈 문자열을 확인할 수 있다.
    6. String.count로 문자열 길이를 확인할 수 있다.
    """)
