//
//  SettingViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 1/3/25.
//

import UIKit

class SettingViewController: UITableViewController {
    // 1. 전체 설정
    var allSet = ["공지사항", "실험실", "버전정보"]
        // 공지사항
        // 실험실
        // 버전 정보
    // 2. 개인 설정
    var privateSet = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcSet = ["고객센터/도움말"]
        // 개인/보안
        // 알림
        // 채팅
        // 멀티프로필
    //기타
        // 고객센터/도움말
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 높이 44
        tableView.rowHeight = 44
       
    }
    // 섹션의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // 섹션 이름
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        } else {
            return "섹션"
        }
    }
    // 각 섹션별 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1{
            return 4
        } else if section == 2 {
            return 1
        } else {
            return 0
        }
    }
    
    // 셀의 디자인과 데이터 - 데이터를 기준으로 생각하기
    // 셀갯수
    // 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = allSet[indexPath.row]
            cell.textLabel?.textColor = .lightGray
            cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = privateSet[indexPath.row]
            cell.textLabel?.textColor = .lightGray
            cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = etcSet[indexPath.row]
            cell.textLabel?.textColor = .lightGray
            cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        } else {
            cell.textLabel?.text = "오류"
        }
        
        
        
        
        
        
        
        
        return cell
    }
    
}
