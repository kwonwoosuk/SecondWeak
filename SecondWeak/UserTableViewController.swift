//
//  UserTableViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 1/3/25.
//

import UIKit


class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        //xib 사용시 다른 cell을 가져오기 위해 내가 쓰겠다 선언 !
    
        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
        //user 스토리 보드로 가서 자신의 씬을 찾음, 화면이 뜨기전에 요청 테이블뷰한테 나 이거 쓸거야 그니까 준비 시켜줘! xib에 구성되어있는 코드를 사용할때

       
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        print(friends[sender.tag])
        friends[sender.tag].like.toggle()
        // tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        print(friends[sender.tag])
    }
    
    
//    - 셀갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    //    - 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let row = friends[indexPath.row]
        
        cell.configureData(row: row)
        //cell.configure()
//         버튼을 구분짓기 위해서 tag를 분류
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    //    - 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    
}
