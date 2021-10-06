import UIKit

//10.2 메서드
/*
 메서드 : 특정 타입에 관련된 함수.
 클래스, 구조체, 열거형 등은 실행하는 기능을 캠슐화한 인스턴스 메서드를 정의할 수 있다.
 또한 타입 자체와 관련된 기능을 실행하는 타입 메서드를 정의할 수도 있다.(클래스 메서드와 유사 개념)
 기존 언어와는 다르게 스위프트에서는 프로그래머가 정의하는 타입(클래스, 구조체, 열거형 등)에 자유롭게 메서드를 정의할 수 있다.
 */

/*
 10.2.1 인스턴스 메서드
 인스턴스 메서드란 특정 타입의 인스턴스에 속한 함수
 인스턴스 내부의 프로퍼티 값을 변경하거나 특정연산 결과를 반환하는 등 인스턴스와 관련된 기능 실행
 + 인스턴스 instance
 구현된 구체적인 실체, 실제 메모리에 할당된다.
 (스위프트에서는 한정적인 인스턴스 용어 사용)
 */
//10-18 클래스의 인스턴스 메서드

class LevelClass {
    //현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        //프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(lever)")
        }
    }
    
    //레벨이 올랐을 때 호출할 메서드
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down!)
        level -= 1
        
            if level < 0 {
            reset()
            }
    }
    
    //특정 레벨로 이동할 때 호출할 메서드
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    //레벨을 초기화할 때 호출할 메서드
    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()

levelClassInstance.levelUp() //Level 1
levelClassInstance.levelDown() //Level -1 -> reset 메서드 호출, Level 0
levelClassInstance.jumpLevel(to: 3) //Level 3
