//
//  NumberViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 12/30/24.
//

import UIKit
import Kingfisher
class NumberViewController: UIViewController {
    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        setViewBackground()
        
        
        
        
        
        
        //print(NSHomeDirectory())
//        getToday() // 오늘 날짜라는건 유추할 수 있지만 레이블에 나타내주겠다는 예측하기 어려움
        dateLabel.text = getToday() //== today
        
        
        
        //데이터 가져오기
        let result = UserDefaults.standard.string(forKey: "number")
        numberTextField.text = result
        

    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        // 텍스트필드에 적었던 내용을 영구적으로 저장
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        // 텍스트필드에 적힌 내용을 number라는 키로 저장하겠다 !
        
        // 사용자에게 성공적으로 저장이 되었다는 알림을 주기
        // alert! 알림 == 다이얼로그 (안드)
        
        // 1. 타이틀 + 메세지
        let alert = UIAlertController(title: "저장되었습니다", message: "숫자가 성공적으로 저장되었어요", preferredStyle: .actionSheet)
        // 2. 버튼
        let ok = UIAlertAction(title: "확인", style: .default)
        let test1 = UIAlertAction(title: "테스트1", style: .default)
        let test2 = UIAlertAction(title: "테스트2", style: .default)
        let test3 = UIAlertAction(title: "테스트3", style: .cancel)
        // 3. 본문에 버튼 추가
        alert.addAction(ok)
        alert.addAction(test1)
        alert.addAction(test2)
        alert.addAction(test3)
        // 4. 화면에 띄우기
        present(alert, animated: true)
        
        
//        print("save!")
        
    }
    
    
    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        
        // 실시간으로 레이블에 내용 반영
        // 입력한 내용이 숫자라면 숫자 그대로 출력
        // 입력한 내용이 문자라면 숫자가 아닙니다 출력
        
        // 실시간으로 레이블에 내용반영 확인
        // Optional string ->String
        
        guard let jack = numberTextField.text else {
            print("옵셔널 오류")
            return
        }
        
        // jack: "5" -> 5
//        if Int(jack) != nil {
//            print(Int(jack)!)
//        } else {
//            print("숫자가 아닙니다")
//        }
        
        
    //        if let intJack = Int(jack) {
    //            resultLabel.text = String(intJack)
    //        } else {
    //            resultLabel.text = "숫자가 아닙니다"
    //        }
        
        guard let intJack = Int(jack) else {
            resultLabel.text = "숫자가 아닙니다"
            return }
        resultLabel.text = String(intJack)
        
        //resultLabel.text = jack
        
        
        
//        if let number = Int(numberTextField.text!) {
//            resultLabel.text = numberTextField.text
//        } else {
//            resultLabel.text = "숫자가 아닙니다"
//        }
    }
    // 매개변수가 없는 함수
    func randomInt() -> Int { // Void 생략가능
        Int.random(in: 1...100)
    }
    
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        let today = format.string(from: Date())
        dateLabel.text = today
        print(today)
        return today
    }
    
    
}
