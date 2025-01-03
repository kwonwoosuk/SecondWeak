//
//  UserTableViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        print(friends[sender.tag])
        friends[sender.tag].like.toggle()
        tableView.reloadData()
        print(friends[sender.tag])
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let row = friends[indexPath.row]
        let image = row.profile_image
        
        if let image {
            let url = URL(string: image)
            cell.profileImageView.kf.setImage(with: url)
        } else {
            cell.profileImageView.image = UIImage(systemName: "person")
        }
        
        let name = row.like ? "heart.fill" : "heart"
        cell.likeButton.setImage(UIImage(systemName: name), for: .normal)
        // 버튼을 구분짓기 위해서 tag를 분류
        cell.likeButton.tag = indexPath.row
        // IBAction 대신 코드로 연결
        // Function Types
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        //        if row.like {
        //            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        //        } else {
        //            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        //        }
        
        
        
        cell.nameLabel.text = row.name
        cell.messageLabel.text = row.message
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 15)
        cell.messageLabel.font = .systemFont(ofSize: 13)
        
        return cell
        
        
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    
}
