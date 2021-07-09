/*
 2-1 문자열 보간법 사용
 문자열 보간법 String Interpolation
 : 변수 또는 상수 등의 값을 문자열 내에 나타내고 싶을때 사용
 */

import UIKit

let word:String="SWIFT"
print("Hello, \(word)")
dump(word)
//dump()는 출력하려는 인스턴스의 자세한 내부 콘텐츠까지 출력한다.

/*
 2-2 한 줄 주석
 */
//한 줄 주석 달기

/*
 2-3 여러 줄 주석
 여러 줄 주석 달기
 */

/*
 2-4 중첩 주석
 /*
 스위프트는 여러 줄 주석 안에 여러 줄 주석 또는 한 줄 주석 넣는 중첩 주석을 지원
 */
 */

/*
 + 퀵헬프 사용하기
 퀵헬프: 레퍼런스 문서의 요약된 내용을 보여주는 기능
 커서+option, 클릭
 주석을 퀵헬프 기능을 통해 볼 수 있게 하려면 마크업 문법을 사용해 작성
 
2-5 퀵헬프를 위한 마크업
 잘 안되므로 나중에 다시 알아보고 연습해보도록 한다..
 */

/*
 2-6 변수의 선언 및 사용
 변수는 생성 후 데이터 값을 변경할 수 있다.
 컴파일러의 타입 추론 기능이 있기 때문에 데이터 타입을 생략할 수 있다.
 */
var name:String="SWIFT"
var age:Int=11
var job="IOS programmer" //타입 추론 사용
var height=2000.5
print("\(type(of: height))") //해당 변수의 타입 출력
age=99 //변수는 값 변경 가능
job="Blank" //값을 변경할 때는 기존과 같은 타입의 값을 할당해주어야 한다.
print("저의 이름은 \(word)이고, 나이는 \(age)입니다. 직업은 \(job)이며 높이는 \(height)입니다.")

/*
 2-7 상수의 선언 및 사용
 상수-> 값 변결 불가능
 사용 이유:
 가독성이 좋다->차후 값 변화가 없다는 사실을 직관적으로 알 수 있기때문.
 특정 값에 특별한 의미를 부여
 예) 최댓값 100. 100 숫자에 의미를 부여하기 위해 let maxInputValue=100 선언 가능
 */
let name:String="SWIFT" //상수


