//
//  UserViewController.swift
//  March5thCocoaPodsLab
//
//  Created by Margiett Gil on 3/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Kingfisher

class UserViewController: UIViewController {
    private let userView = UserView()
    
    override func loadView() {
        view = userView
    }
    
    private var userDetail: User
    
    init(userDetail: User) {
        self.userDetail = userDetail
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(for: userDetail)
        view.backgroundColor = .systemBackground
        

    }
    private func updateUI(for user: User) {
        userView.nameLabel.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        userView.phoneLabel.text = " Phone #: \(user.phone)"
        userView.addressLabel.text = "\(user.location.street),  \(user.location.city),  \(user.location.state), \(user.location.postcode)"
        userView.userProfileImage.kf.setImage(with: URL(string: user.picture.large))
    }
    

}
