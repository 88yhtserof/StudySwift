import UIKit

//Chapter10 프로퍼티와 메서드
//10.1 프로퍼티
/*
 10.1.1 저장 프로퍼티
 저장 프로퍼티: 인스턴스의 변수 또는 상수를 의미. 구조체와 클래스에서만 사용
 기존 프로그래밍 언어에서 사용되돈 인스턴스 변수는 저장 프로퍼티
 */
//10-1 저장 프로퍼티의 선언 및 인스턴스 생성
//좌표
struct CoordinatePoint {
    var x: Int  //저장 프로퍼티
    var y: Int  //저장 프로퍼티
}

//구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다.
/*
 NOTE_구조체와 클래스의 저장 프로퍼티
 구조체의 저장 프로퍼티를 모두 포함하는 이니셜라이저를 자동으로 생성한다.
 클래스의 저장 프로퍼티는 옵셔널이 아니라면 프로퍼티 기본값을 지정해주거나 사용자 정의 이니셜 라이저를 통해 반드시 초기화해주어야 한다.
 */
let yhPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

//사람의 위치 정보
class Position {
    var point: CoordinatePoint //저장 프로퍼티(변수) - 위치(point)는 변경될 수 있음을 뜻한다.
    let name: String //저장 프로퍼티(상수)
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

//사용자 정의 이니셜 라이저를 호출해야 한다.
//그렇지 않으면 프로퍼티 초기값을 할당할 수 없기 때문에 인스턴스 생성이 불가능하다.
let yhPosition: Position = Position(name: "yh", currentPoint: yhPoint)

