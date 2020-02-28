//
//  UserCell.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import SnapKit


class UserCell: UICollectionViewCell {
 
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = 13
    }
    
    public lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        imageconstraints()
        labelConstraints()
    }
    private func imageconstraints() {
        addSubview(userPhoto)
        userPhoto.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self).inset(8)
            make.height.equalTo(self).multipliedBy(0.3)
        }
    }
    private func labelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(8)
        }
    }
    
    public func configureCell(user: User) {
        userNameLabel.text = "\(user.name.first) \(user.name.last)"
     
        //import kingfisher for photos
    }
}
