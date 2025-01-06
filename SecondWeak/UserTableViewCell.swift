//
//  UserTableViewCell.swift
//  SecondWeak
//
//  Created by 권우석 on 1/3/25.
//

import UIKit
import Kingfisher
// UITableViewCell
//   ^  |
//   |  *
// UserTableViewCell
class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
        // MARK: - 절대 안바뀔 셀 디자인
    override func awakeFromNib() { //  약간이라도 리소스를 아낄수 있다 !
        super.awakeFromNib()  // 잘 기억해두기 !! 시간 지나면 다들 까먹음
        print(#function)
        configure() // 절대 안바뀔 셀 디자인을 여기에 !
            
        
    }
    
    private func configure() {
        profileImageView.backgroundColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.font = .systemFont(ofSize: 13)
    }
    
    func configureData(row: Friends) {
        print(#function)
       
        nameLabel.text = row.name
        messageLabel.text = row.message
        
        let image = row.profile_image
        
        if let image {
            
            let url = URL(string: image)
            profileImageView.kf.setImage(with: url)
            
        } else {
            profileImageView.image = UIImage(systemName: "person")
        }
        
        let name = row.like ? "heart.fill" : "heart"
        let btn = UIImage(systemName: name)
        likeButton.setImage(btn, for: .normal)
    }
    
    
}
