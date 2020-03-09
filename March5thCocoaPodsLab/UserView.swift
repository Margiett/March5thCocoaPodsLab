//
//  UserView.swift
//  March5thCocoaPodsLab
//
//  Created by Margiett Gil on 3/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import SnapKit

class UserView: UIView {

    public lazy var userProfileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person.fill")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 60
        return iv
        
    }()
    
    public lazy var nameLabel: UILabel = {
        let layout = UILabel()
        layout.font = UIFont.preferredFont(forTextStyle: .headline)
        layout.textAlignment = .center
        layout.numberOfLines = 0
        return layout
    }()
    
    public lazy var phoneLabel: UILabel = {
        let layout = UILabel()
        layout.font = UIFont.preferredFont(forTextStyle: .subheadline)
        layout.numberOfLines = 0
        layout.text = "Phone Number"
        
        return layout
    }()
    
    public lazy var addressLabel: UILabel = {
        let layout = UILabel()
        layout.font = UIFont.preferredFont(forTextStyle: .subheadline)
        layout.numberOfLines = 0
        layout.text = "Address"
        
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setupImageView()
        setupNameLabel()
        setupPhoneNumber()
        setupAddressLabel()
    }
    
    private func setupImageView() {
        addSubview(userProfileImage)
        userProfileImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo (self)
        }
    }
    private func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    private func setupPhoneNumber() {
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userProfileImage).offset(200)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
    }
    private func setupAddressLabel() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel).offset(200)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            
        }
    }

}
