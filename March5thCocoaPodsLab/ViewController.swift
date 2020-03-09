//
//  ViewController.swift
//  March5thCocoaPodsLab
//
//  Created by Margiett Gil on 3/5/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var user = [User](){
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        loadInfo()
    }
    
    func loadInfo() {
        APIClient.getUsers { (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let user):
                self.user = user
                dump(user)
            }
        }
    }


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCell else {
            fatalError("could now down cast to usercell")
        }
        let users = user[indexPath.row]
        cell.configureCell(user: users)
        cell.backgroundColor = .systemBackground
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItem: CGFloat = 11
        let numberOfItem: CGFloat = 3
        let totalSpacing: CGFloat = (2 * spacingBetweenItem) + (numberOfItem - 1) * spacingBetweenItem
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItem
        let itemHeight: CGFloat = maxSize.height * 0.23
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let users = user[indexPath.row]
        let userDetail = UserViewController(userDetail: users)
        present(UINavigationController(rootViewController: userDetail), animated:  true)
    }
    
    }

