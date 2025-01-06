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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let row = friends[indexPath.row]
        
        cell.configureData(row: row)
        //cell.configure()
        // 버튼을 구분짓기 위해서 tag를 분류
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    //    - 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    
}
