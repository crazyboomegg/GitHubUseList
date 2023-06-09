//
//  UserListTableViewCell.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/23.
//

import Foundation
import UIKit
import Kingfisher

class UserListTableViewCell: UITableViewCell {
    
    var user: UserViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
        addConstraints()
        contentView.backgroundColor = UIColor.green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func bind(users: UserViewModel) {
        
        self.idLabel.text = users.name
        self.profileImage.kf.setImage(with: URL(string: users.image))
        if users.staff {
            StaffView.isHidden = false
        } else {
            StaffView.isHidden = true
        }
        
        
        
    }
    
    
    
    func addUI() {
        [idLabel, StaffView].forEach { (view) in
            stackView.addArrangedSubview(view)
        }
        [profileImage, stackView].forEach { (view) in
            baseView.addSubview(view)
        }
        
        contentView.addSubview(baseView)
    }
    
    func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(25)
            make.top.equalTo(baseView.snp.top).offset(15)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(profileImage.snp.right).offset(5)
            make.centerY.equalTo(profileImage)
        }
        
    }
    
    
    private var baseView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.white
        view.layer.shadowOffset = CGSize(width: 1.5, height: 3)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
        return view
    }()
    
    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_friends_female_default")
        imageView.layer.cornerRadius = 30
        return imageView
    }()

    private var idLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "江博弈"
        return label
    }()
    
    
    private var StaffView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(hexString: "2986cc")
        
        let label = UILabel.init()
        label.text = "STAFF"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
        }
        
        return view
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
}

