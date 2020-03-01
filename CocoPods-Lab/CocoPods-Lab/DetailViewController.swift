//
//  DetailViewController.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/29/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    private var user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.backgroundColor = .white
        updateUI(for: user)
    }
    
    private func updateUI(for user: User) {
        detailView.userNameLabel.text = "\(user.name.first) \(user.name.last)"
        detailView.userBirthdayLabel.text = user.dob.date
        detailView.userLocationLabel.text = "\(user.location.street.number) \(user.location.street.name) \n\(user.location.city), \(user.location.state), \(user.location.postcode)"
        detailView.userPhoneNumberLabel.text = user.cell
        
        guard let imageURL = URL(string: user.picture.large) else {
            return
        }
        detailView.userPhoto.kf.setImage(with: imageURL)
    }
    


}
