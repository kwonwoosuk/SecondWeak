//
//  ViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 12/30/24.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://i.namu.wiki/i/w7MGBNy1q_jhciP3RtKLluSDU69ON7U5L3ntMRHyWC__rX-SaXE6ZVQHWCZxaA3O96kI2sXJBBgSUgXir0b2MZAniMV_VH0Ruw5sKpJB93ccfFqqht6v1iNcu70uRztN4dFMO1DamXvjVtUKyCUZFg.webp") {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(systemName: "star")
        }
        
        
        
        
        print(resultLabel.isUserInteractionEnabled)
        
        //유저 인터렉션으 막는거랑 is Enabled랑 뭐가 다른가?
        
        checkButton.isEnabled = false //버튼색이 죽어버려서 애초에 고지 하는 느낌
        resultLabel.isUserInteractionEnabled = true
        // 사용자의 이벤트를 인식할 수 있게끔
        
    }

    //Did End On Exit
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        
//        wordTextField.text = nil //  "" nil절대로 안들어감 애플이 내부적으로 nil 입력시 빈문자열을 주는듯...
        let text = wordTextField.text!.uppercased()
        print(text)
        //예외처리의 기본적인 모습
        // 공백도 제거를 해야겠다! whitespace 찾아보기!
        if text.count == 0 || text == " " {
            resultLabel.text = "검색어를 작성해주세요"
        } else if text == "JMT" {
            resultLabel.text = "완전맛있음"
        } else {
            resultLabel.text = "\(text)로 입력했어요"
        }
    }
    
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    func aboutOptional() {
        
        //: String? 옵셔널 스트링 타입
        var nickname: String? = "고래밥"
        //var nickname: Optional<String> = "고래밥"
        var age: Int? = 22
        
        
        
        nickname = nil
        print(nickname!)
        
        // 옵셔널 해결 방법
        // 1. 조건문을 통해 옵셔널 언래핑
        if let nickname = nickname { // 두가지 변수의 타입이 다르다!
            print("\(nickname)으로 설정합니다 ")
        } else {
            print("닉네임에 문제가 있어요")
        }// 변수가 근데 여러번 쓰이면 계속 !를 붙여야되는 경우가 생길 수 있어서 옵셔널 바인딩의 개념이 나옴
        // 2. 옵셔널 바인딩: if let / guard
        // Swift 5.7 if let shorthand
        if let age { // if let shorthand
            print(age)
        } else {
            print("나이가 nil 입니다")
        }
        
        // nil에 대한 대응이 먼저
        guard let age else { print("옵셔널 해제 실패했어여 age가 nil임다") }//return을 안써도 문제가 되지는 않음
        
        // 3. ??
        print(nickname ?? "손님")
        // 4. 옵셔널 체이닝
        wordTextField.text?.count
        // ==    ?. nil이면 이후에 코드 실행 안함
        if let text = wordTextField.text {
            print(text.count)
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
}

