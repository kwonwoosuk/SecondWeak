//
//  BasicTableViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {

    
    var list = ["프로젝트", "메인업무", "새싹과제새싹과제새싹과제새싹과제새싹과제새싹과제","프로젝트", "메인업무", "새싹과제","프로젝트", "메인업무", "새싹과제","프로젝트", "메인업무", "새싹과제","프로젝트", "메인업무", "새싹과제","프로젝트", "메인업무", "새싹과제","프로젝트", "메인업무", "새싹과제"] {
        didSet{ //프로퍼티가 달라질때 // 속성감시자
            tableView.reloadData()
        }
    }
    let randomList = ["고래밥", "칙촉", "사과"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //var monster = Monster() // 초기화를 한다 == 인스턴스
        
        tableView.rowHeight = UITableView.automaticDimension // 셀의 높이가 고정일때는 프로퍼티로 사용해도 되지만 셀마다 달라야할때는 메서드를 이용한다 메서드안에서 조건분기
        
        
    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        // 랜덤으로 셀 하나씩 추가
        if let random = randomList.randomElement() {
            print("before",list)
            list.append(random) // 배열에 안들어갈 수도 있다
            print("after",list)
        }
        //뷰와 데이터는 따로 놀아서, 늘 잘 맞춰 주어야한다
        
        
            
            
        tableView.reloadData()// ‼️‼️‼️‼️‼️ 테이블에 대해 연관된 섹션과 셀을 리로드 해달라 !!
    }
    
    
    
    
    
    
    
    // 절대적인 시간을 좀 투자해서 정리를 잘 해두자 ‼️‼️‼️‼️‼️
    // 1. 셀의 갯수 numberOfRowsInSection
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // 셀을 여러개 쓸게 아니면 기본값이 1 이기때문에 생략가능
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
        
    }
    
    // 3. 셀의 높이 heightForRowAt ‼️ 오토디메션 안먹음 ^^
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function)
//        return 80
//    }
//    
    // 2. 셀 디자인 및 데이터 처리 cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jackCell")!
        
//        cell.textLabel?.text = "텍스트 레이블"
//
//        if indexPath.row == 0 {// 0번 index일때 만 중괄호가 실행되니까
//            cell.textLabel?.text = list[0] // list[0]-> [indexPath.row] 바꿔도 되지 않을까?
//        } else if indexPath.row == 1 {
//            cell.textLabel?.text = list[1]
//        } else if indexPath.row == 2  {
//            cell.textLabel?.text = list[2]
//        } else {
//            cell.textLabel?.text = "오류"
//        }
        //==> cell.textLabel?.text = list[indexPath.row] 위에 조건문이 이 한문장으로 정리 가능
        cell.textLabel?.text = list[indexPath.row]
        
        
        // 테이블뷰는 재사용 되기에  else문이 없을경우 모든경우에 대해 대비할 수 없기때문에 의도지 않은 작업이 실행된다
        if indexPath.row <= 3 {
            cell.backgroundColor = .gray
        } else {
            cell.backgroundColor = .white
        }
        
        
        cell.detailTextLabel?.text = "디테일 텍스트 레이블"
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.setPrimaryLabel("test")
        cell.textLabel?.textColor = .blue
        cell.textLabel?.font = .systemFont(ofSize: 30)
        print(#function, indexPath)
        return cell
    }
    // 셀을 클릭했을때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
