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

var test1 = ["a", "b"]
var test2 = Array<String>()

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

names2.append("kim")
//["catherine", "swift", "keller", "ariana", "renee", "kim", "tae", "rachel", "sandra", "joan", "kim"]
print(names2.firstIndex(of: "kim")) //해당 인수와 일치하는 요소 중 첫번쨰 요소의 인덱스 반환
print(names2.lastIndex(of: "kim")) //해당 인수와 일치하는 요소 중 마지막 요소의 인덱스 반환
print(names2.last)  //last 프로퍼티를 이용해 맨 마지막 요소를 알 수 있다.
print(names2.first) //first 프로퍼티를 이용해 맨 처음 요소를 알 수 있다.

let firstItem:String = names2.removeFirst() //첫 번째 요소를 삭제 후 반환
let lastItem:String = names2.removeLast() //마지막 요소를 삭제 후 반환
let indexZeroItem:String = names2.remove(at: 0)// 해당 인덱스 요소 삭제 후 반화
//removeFirst(k:)와 removeLast(k:)도 쓸 수 있다.

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

var dictionary5 = ["test1": 1, "test2":2]

/*
 4-9 딕셔너리의 사용
 딕셔너리는 배열과는 다르게 딕셔너리 내부에 없는 키로 접근해도 오류가 발생하지 않는다. 찾고자 하는 키가 없다면 nil은 반환한다.
 */
print(numberForName5["88yhtserof"])
print("ari") //찾고자 하는 키가 없다면 nil반환

numberForName5["88yhtserof"] = 600 //"88yhtserof" 키의 값은 변경한다.
numberForName5["ariana"] = 900 // "ariana":900인 키와 값 쌍을 딕셔너리에 추가한다
print(numberForName5) //딕셔너리는 요소들이 순서 상관없이 저장된다

var returnValue: Int? = numberForName5.removeValue(forKey: "kim") //키에 해당하는 딕셔너리 요소를 삭제 후 반환
print(numberForName5.removeValue(forKey: "88yhtserof") )
if let returnValue = numberForName5.removeValue(forKey: "ariana"){
    print("remove")
}
else{
    print("No found")
}

//키에 해당하는 요소가 없을 때 nil이 아닌 기본값을 반환하게 할 수 있다.
print(numberForName5["88yhtserof", default: 0])

numberForName5.updateValue(888, forKey: "renee")

//4.4.3 세트
/*
 4-10 세트의 선언과 생성
 세트set:같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입. 세트 내의 값은 유일 값
 */
//빈 세트 생성법
var testSet1: Set<String> = Set<String>()
var testSet2: Set<String> = []

//Array와 마찬가지로 대괄호를 사용
var testSet3: Set<String> = ["88yhtserof", "ari", "renee"]
//그렇기 때문에 타입 추론을 사용하게 되면 컴파일러는 Set이 아닌 Array 타입으로 지정한다.
var testType = [1,2,3]
print(type(of: testType)) //type(of: ) 타입 확인 메서드

print(testSet1.isEmpty) //isEmpty프로퍼티를 사용해서 빈 여부를 알 수 있다.
print(testSet3.count)   //count프로퍼티를 사용해 요소의 개수를 알 수 있다.

/*
 4-11 세트의 사용
 */
print(testSet3.count)
testSet3.insert("sandra") //세트에 요소를 추가한다
print(testSet3)

print(testSet3.remove("renee")) //0번 인덱스에 있는 요소 삭제 후 반환
print(testSet3.remove("kim")) //없는 요소를 삭제하려 하면 nil 반환
let removeTest: String? = testSet3.remove("sandra")

/*
 4-12 세트의 활용 - 집합연산
 세트는 자신 내부의 값들이 모두 유일함을 보장하므로 집합관계를 표현하고자 할 때 유용하다.
 */
let englishClassStudents: Set<String> = ["john", "chulsoo", "minho"]
let koreanClassStudents: Set<String> = ["jenny", "minho", "chulsoo", "minsoo"]

//교집합
let intersectSet: Set<String>
    = englishClassStudents.intersection(koreanClassStudents)
print(intersectSet)

//여집합의 합(배타적 논리합) - 교집합의 여집합
let symmetricDiffSet: Set<String>
    = englishClassStudents.symmetricDifference(koreanClassStudents)
print(symmetricDiffSet)

//합집합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)
print(unionSet)

//차집합
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)
print(subtractSet)  //john

print(unionSet.sorted()) //sorted 메서드를 통하여 정렬된 배열을 반환

/*
 4-13 세트의 활용 - 포함관계 연산
 세트는 포함 관계를 연산할 수 있는 메서드로 구현되어있다.
 */
let bird: Set<String> = ["비둘기", "닭", "기러기"]
let mammal: Set<String> = ["사자", "호랑이", "곰"]
let animal: Set<String> = bird.union(mammal) //합집합

print(bird.isDisjoint(with: mammal))  //서로 배타적인가요? true
print(bird.isSubset(of: animal)) // 새가 동물의 부분집합인가요? true
print(animal.isSuperset(of: mammal)) //동물은 포유류의 전체집합인가요? true
print(animal.isSuperset(of: bird)) //동물은 새의 전체집합인가요? true
print(animal.isStrictSubset(of: bird)) //false
print(animal == bird)  //false

//4.5 열거형
//4.5.1 기본 열거형
/*
 4-14 School 열거형의 선언
 열거형은 연관된 항목들을 묶어서 표현할 수 있는 타입.
 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가하다.
 enum 키워드 사용.(enumerate: 열거하다)
 각 항목이 그 자체로 고유의 값이될 수 있다.
 */
enum School1{
    case primary  //유치원
    case elementary //초등
    case middle //중등
    case high  //고등
    case college  //대학
    case university //대학교
    case graduate //대학원
}

/*
 4-15 School열거형의 선언
 한 줄에 모두 표현해 줄 수도 있다.
 */
enum School2{
    case primary, elementary, middle, high, college, university, graduate
}

/*
 4-16 School 열거형 변수의 생성 및 값 변경
 */
var highestEducationLevel1: School1 = School1.university

//위 코드와 같은 표현
var highestEducationLevel2: School1 = .university

//같은 타입인 School 내부의 항목으로만 highestEducationLevel1의 값을 변경해 줄 수 있다
highestEducationLevel1 = .graduate

//4.5.2 원시 값
/*
 4-17 열거형의 원시 값 지정과 사용
열거형의 각 항목은 자체로도 하나의 값이지만 항목의 원시값Raw Value 도 가질 수 있다.
 즉 특정 타입으로 지정된 값을 가질 수 있다.
원시값은 rawValue 프로퍼티를 통해 가져올 수 있다.
 */
enum School3: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel3: School3 = School3.university
print("저의 최종학력을 \(highestEducationLevel3.rawValue) 졸업입니다.")
//저의 최종 학력은 대학교 졸업입니다.

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)요일 입니다.")
//오늘은 금요일입니다.

/*
 4-18 열거형의 원시 값 일부 지정 및 자동 처리
 일부 항목만 원시 값을 줄 수 있다.
 문자열 형식의 원시 값을 지정해줬다면 각 항목 이름을 그대호 원시값ㅇ로 갖게 되고
 정수 타입이라면 첫 항목을 기준으로 0부터 1씩 늘어난 값을 갖게 된다.
 */
enum School4: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

let highestEducationLevel4: School4  = School4.university
print("저의 최종학력은 \(highestEducationLevel4.rawValue) 졸업입니다.")
//원시 값을 지정해 주지 않은 항목은 rawValue 프로퍼티에 항목 이름 그대로 들어감

//변수 또는 상수에 할당해 주지 않아도 항목에 접근할 수 있다.
print(School4.elementary.rawValue)

enum Number1: Int{
    case ten = 10
    case Zero //11
    case one //12
    case two//13
    //원시값을 가지지 않는 항목은 첫 항목인 10을 시작으로 1씩 늘어난 값을 원시값을 갖게 된다.
    //원시값이 없는 것끼이 나열되어야 한다. 뒤섞여 있으면 오류
}

print(Number1.Zero.rawValue, Number1.one.rawValue, Number1.two.rawValue, Number1.ten.rawValue)

enum Number2: Int{
    case Zero //0
    case one //1
    case two //2
    case ten = 10
}
print(Number2.Zero.rawValue, Number2.one.rawValue, Number2.two.rawValue, Number2.ten.rawValue)

/*
 4-19 원시 값을 통한 열거형 초기화
 열거형의 원시 값 정보를 안다면 원시 값을 통해 열거형 변수 또는 상수를 생성해줄 수도 있다.
 올바르지 않은 원시 값을 통해 생성하려 한다면 nil 반환한다.
 */
let primary = School4(rawValue: "유치원") //primary
let graduate = School4(rawValue: "대학원") //nil

let one = Number2(rawValue: 1) //1
let three = Number2(rawValue: 3) //nil

//4.5.3  연관값
/*
 4-20 연관 값을 갖는 열거형
 */
enum MainDish1 {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSause: Bool)
    case rice //일부 항목만 연관값을 가져도 된다.
}

var dinner: MainDish1 = MainDish1.pasta(taste: "크림") //크림 파스타
dinner = .pizza(dough: "치즈크러스트", topping: "불고기") //불고기 치즈크러스트 피자
dinner = .chicken(withSause: true) //양념통닭
dinner = .rice //밥

/*
 4-21 여러 열거형의 응용
 항목의 연관값을 특정 항목으로 한정지으려면 연관값도 열거형으로 바꾸자
 */
enum PastaTaste {
    case cream, tomato
}
enum PizzaDough {
    case cheeseCrust, thin, original
}
enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish2 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(wihtSaurce: Bool)
    case rice
}

var lunch: MainDish2 = MainDish2.pasta(taste: PastaTaste.tomato)
lunch = MainDish2.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)

//4.5.4 항목 순회
/*
 4-22 CaseInterable 프로토콜을 활용한 열거형의 항목 순회
 열거형 선언 시 CaseIterable 프로토콜을 채택한 후 열거형에 allCases 프로퍼티를 통해 모든 케이스의 컬렉션을 생성해준다.
 */
enum School5: CaseIterable { //프로토콜 채택
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases1: [School5] = School5.allCases //모든 케이스의 컬렉션 생성
print(allCases1)

/*
 4-23 원시 값을 갖는 열거형 의 항목 순회
 */
enum School6: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등"
}

let allCases2: [School6] = School6.allCases // 컬렉션 생성
print(allCases2)

//4.5.5 순환 열거형
/*
 4-26 특정항목에 순환 열거형
 순환열거형은 연관 값이 열거형 자신의 값이고자 할 때 사용
 indirect 키워드 사용
 */
//산술 연산을 위해 정의한 열거형
enum ArithmeticExpression1 {
    case number(Int)
    indirect case addition(ArithmeticExpression1, ArithmeticExpression1)
    indirect case multiplication(ArithmeticExpression1, ArithmeticExpression1)
}

/*
 4-27 열거형 전체에 순환 열거형 명시
 */
indirect enum ArithmeticExpression2 {
    case number(Int) //정수를 연관값으로 갖는 항목
    case addition(ArithmeticExpression2, ArithmeticExpression2) //덧셈을 위한 항목
    case multiplication(ArithmeticExpression2, ArithmeticExpression2) // 곱셈을 위한 항목
}

/*
 4-28 순환 열거형의 사용
 ArithmeticExpression2 열거형을 사용하여 (5 + 4) * 2 구현하는 예제
 */
let five = ArithmeticExpression2.number(5)
let four = ArithmeticExpression2.number(4)
let sum = ArithmeticExpression2.addition(five, four) //5+4
let final = ArithmeticExpression2.multiplication(sum, ArithmeticExpression2.number(2)) //(5+4)*2

//ArithmeticExpression2 열거형의 계산을 도와주는 순환 함수(Recursive Function) (재귀적 함수)
func evaluate(_ expression: ArithmeticExpression2) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5+4)*2 = \(result)")

//4.5.6 비교 가능한 열거형
/*
 4-29 비교 가능한 열거형의 사용
 Comporable 프로토콜을 준수하는 연관값만 갖거나
 연관 값이 없는 열거형은 Comparable 프로토콜을 채택하면 각 케이스를 비교 할 수 있다.
 케이스가 열거형 선언의 앞에 위치할 수록 작은 값을 가진다.
 */
enum Condition: Comparable {//Comparable 프로토콜 채택하면 각 케이스를 비교할 수 있다.
    case terrible
    case bad
    case good
    case great
    //크기 비교 terrible<bad<good<great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요.")
}else{
    print("당신의 상태가 더 좋군요.")
}
//제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macbook, iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "24.3"))
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macbook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)
