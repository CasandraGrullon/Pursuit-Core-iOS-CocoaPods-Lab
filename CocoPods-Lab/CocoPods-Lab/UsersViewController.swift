//
//  ViewController.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/27/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit


class UsersViewController: UIViewController {

    private var usersView = UsersView()
    
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.usersView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = usersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        usersView.collectionView.delegate = self
        usersView.collectionView.dataSource = self
        usersView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
    }
    
    private func loadUsers() {
        UserAPIClient.getUsers { (result) in
            switch result {
            case .failure(let error):
                print("could not get users \(error)")
            case .success(let users):
                self.users = users
            }
        }
    }



}
extension UsersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 0.2
        let maxSize: CGFloat = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 4
        let totalSpace: CGFloat = numberOfItems * itemSpacing 
        let itemWidth: CGFloat = (maxSize - totalSpace) / numberOfItems
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = usersView.collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not cast to usercell")
        }
        let user = users[indexPath.row]
        cell.configureCell(user: user)
        cell.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        let detailVC = DetailViewController(user: user)
        present(detailVC, animated: true)
    }
    
}
