//
//  UIColor+Extension.swift
//  SecondWeak
//
//  Created by 권우석 on 1/6/25.
//

import UIKit

extension UIColor { //  모든 인스턴스의 확장이기때문에 인스턴스 생성 이후에 사용하는거기때문에 확장에서 인스턴스를 생성하는게 말이 안되는 것 !
    // 저장프로퍼티, 인스턴스 프로퍼티
    
    // var jackColor = UIColor.red--------------❌Extensions must not contain stored properties
    // 저장 프로퍼티, 타입 프로퍼티
    static var backColor = UIColor.red // 어떤 공간에서 호출해도 한곳에만 저장되고 아무때나 갖다 쓸 수 있으니까 !
    
    //연산프로퍼티
    var denColor: UIColor { // 값을 직접 갖고있지 않고 호출시 사용하는 쪽으로 던져준다
        return .red
    }
}
