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


 //4.3 튜플
/*
 4-3 튜플 기본
 튜플(Tuple) : 지정된 데이터 묶음
 */
//String, Int, Double 타입을 갖는 튜플
var person1: (String, Int, Double) = ("88yhtserof", 100, 200.5)

//인덱스를 통해서 값을 빼 올 수 있습니다.
print("이름: \(person1.0), 나이: \(person1.1), 신장: \(person1.2) person: \(person1) self: \(person1.self) ")

person1.1 = 99 //인덱스를 통해 값을 할당할 수 있다.
person1 = ("change", 150, 300.5) //요소를 한 번에 모두 바꿀 수 있다.

print(person1)

/*
 4-4 튜플 요소 이름 지정
 튜플 요소마다 이름을 붙여줄 수 있다.
 */
//String, Int, Double 타입을 갖는 튜플
var person2: (name: String, age:Int, height: Double) = ("88yhtserof", 100, 200.5)

//요소 이름을 통해서 값을 빼 올 수 있다.
print("이름: \(person2.name), 나이: \(person2.age), 신장: \(person2.height)")

person2.age = 199 //요소 이름을 통해 값을 할당할 수 있다.
person2.0 = "change" //인덱스를 통해서도 값을 할당할 수 있다.

print(person2)

/*
 4-5 튜플 별칭 지정
 타입 별칭을 사용하여 조금 더 깔끔하고 안정하게 코드를 작성할 수 있다.
 타입별칭(typealias) : 데이터 타입에 임의로 다른 이름을 부여할 수 있다.
 */
typealias PersonTuple = (name: String, age: Int, height: Double)

let jason: PersonTuple = ("Jason", 19, 100.6)
let swift: PersonTuple = ("Swift", 20, 200.5)

print("jason: \(jason)")
print("swift: \(swift.self)")


//4.4 컬렉션형
//4.4.1 배열
/*
 4-6 배열의 선언과 생성
 배열 Array: 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입
 C언어와 다르게 var 키워드 사용 시 자유롭게 추가 삭제가 가능하다. let은 변경할 수 없다.
 */
//대괄호를 사용하여 배열임을 표현한다.
var names1: Array<String> = ["88yhtserof", "swift", "ariana", "renee"]

//다른 배열 표현 방법. [String]은 Array<String>의 축약 표현이다.
var names2: [String] = ["88yhtserof", "swift", "ariana", "renee"]

//빈 배열 생성
var emptyArray1: [Any] = [Any]()
var emptyArray2: [Any] = Array<Any>() //다른 빈 배열 생성 방법
var emptyArray3: [Any] = [] //배열의 타입을 정확히 명시해줬다면 []만으로도 빈 배열 생성 가능

print(emptyArray1.isEmpty) //isEmpty 프로퍼티로 빈 배열 여부 확인 가능
print(names1.count)  //count 프로퍼티로 배열 요소 개수 확인 가능

/*
 4-7 배열의 사용
 배열은 각 요소에 인덱스를 통해 접근할 수 있으며, 인덱스는 0부터 시작한다.
 */
names2[0] = "catherine" //names2 배열을 var 키워드로 생성했기 때문에 요소 변경 가능
print(names2[0]) //인덱스로 요소 접근 가능

names2.append("rachel") //append메소드로 요소를 추가할 수 있다.
names2.append(contentsOf: ["sandra", "joan"]) //한 개 이상의 요소를 추가할 수 있다.
var numbers = [1, 2, 3, 4, 5]
numbers.append(contentsOf: 10...15) //10부터 15까지의 숫자가 추가된다.
print(numbers)

print(names2)
names2.insert("keller", at: 2) // 인덱스 2 자리에 삽입된다. 기존 요소는 그다음 인덱스로 밀려난다.
print(names2)
names2.insert(contentsOf: ["kim", "tae"], at: 5) //인덱스 5번 위치에 요소가 삽입된다
print(names2)
numbers.insert(contentsOf: 100...103, at: 3)
print(numbers)

print(names2.firstIndex(of: "kim")) //해당 요소의 인덱스를 알 수 있다.
print(names2.last)  //last 프로퍼티를 이용해 맨 마지막 요소를 알 수 있다.
print(names2.first) //first 프로퍼티를 이용해 맨 처음 요소를 알 수 있다.

let firstItem:String = names2.removeFirst() //첫번째 요소를 삭제 후 반환
let lastItem:String = names2.removeLast() //마지막 요소를 삭제 후 반환
let indexZeroItem:String = names2.remove(at: 0)// 해당 인덱스 요소 삭제 후 반화
print(firstItem, lastItem, indexZeroItem)

names2[0 ... 2] = ["1", "2", "3"] //범위의 요소만 바꾸는 것 가능
print(names2[0 ... 5]) // 출력도 가능

//4.4.2 딕셔너리
/*
 4-8 딕셔너리의 선언과 생성
 딕셔너리 Dictionary: 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입
 */
//키는 String, 값은 Int인 빈 딕셔너리를 생성한다.
var numberForName1: Dictionary<String, Int> = Dictionary<String, Int>()

//간단 딕셔너리 생성법
var numberForName2: [String:Int] = [String:Int]()

//typealias를 통해 조금 더 단순하게 표현가능
typealias StringIntDictionary = [String:Int]
var numberForName3: StringIntDictionary = StringIntDictionary()

//딕셔너리의 키와 값 타입을 정확히 명시해줬다면 [:]만으로도 빈 딕셔너리 생성 가능
var numberForName4: [String:Int] = [:]

//선언과 초기화를 동시에 할 수 있다.
var numberForName5: [String:Int] = ["88yhtserof": 100, "renee":200, "catherine": 800]

print(numberForName5)
print(numberForName5.isEmpty)  //false, isEmpty 프로퍼티로 빈 여부 확인 가능
print(numberForName5.count)  //count 프로퍼티로 개수 확인 가능

/*
 4-9 딕셔너리의 사용
 딕셔너리는 배열과는 다르게 딕셔너리 내부에 없는 키로 접근해도 오류가 발생하지 않는다. 찾고자 하는 키가 없다면 nil은 반환한다.
 */
print(numberForName5["88yhtserof"])
print("ari") //찾고자 하는 키가 없다면 nil반환

numberForName5["88yhtserof"] = 600 //"88yhtserof" 키의 값은 변경한다.
numberForName5["ariana"] = 900 // "ariana":900인 키와 값 쌍을 딕셔너리에 추가한다
print(numberForName5) //딕셔너리는 요소들이 순서 상관없이 저장된다

//let returnValue: Int = numberForName5.removeValue(forKey: "88yhtserof") //키에 해당하는 딕셔너리 요소를 삭제 후 반환
print(numberForName5.removeValue(forKey: "88yhtserof") )
if let returnValue = numberForName5.removeValue(forKey: "ariana"){
    print("remove")
}
else{
    print("No found")
}

//키에 해당하는 요소가 없을 때 nil이 아닌 기본값을 반환하게 할 수 있다.
print(numberForName5["88yhtserof", default: 0])
