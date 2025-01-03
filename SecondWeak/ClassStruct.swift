//
//  ClassStruct.swift
//  SecondWeak
//
//  Created by 권우석 on 1/2/25.
//

import Foundation
// 1. 가지고 있는 프로퍼티를 모두 초기화
// 2. 옵셔널로 선언
class Monster {
    var clothes: String
    var speed: Int
    var power: Int
    var experience: Int
    
    
    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
    func initializer(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
}

class BossMonster: Monster {
    // init이 클래스에만 있는 이유 정리   ‼️‼️‼️‼️
}

struct MonsterStruct {
    var clothes: String
    var speed: Int
    var power: Int
    var experience: Int
    //init이 없더라도 기본적으로 제공해줌!  => 멤버와이즈 이니셜라이져 (초기화 구문)
}











