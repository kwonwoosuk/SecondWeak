//
//  UIViewController+Extension.swift
//  SecondWeak
//
//  Created by 권우석 on 1/2/25.
//

import UIKit


extension UIViewController {
    
    // let nickname = "고래밥"
    // Extension은 저장속성을 저장할 수 없다
    
    
    func setViewBackground() {
        view.backgroundColor = .lightGray
    }
    
    func setLabel(label: UILabel, _ text: String) {
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .green
        label.textAlignment = .center
        label.text = text
    }
}
