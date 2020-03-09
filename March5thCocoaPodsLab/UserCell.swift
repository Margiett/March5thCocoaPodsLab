//
//  UserCell.swift
//  March5thCocoaPodsLab
//
//  Created by Margiett Gil on 3/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func configureCell(user: User) {
        guard let imageURL = URL(string: user.picture.large) else { return }
        userImageView.kf.setImage(with: imageURL)
        
        nameLabel.text = "\(user.name.title)\(user.name.first)\(user.name.last)"
        addressLabel.text = "\(user.location.street.number)\(user.location.street.name)\(user.location.city)\(user.location.state)\(user.location.postcode)"
        
    }
    
}
