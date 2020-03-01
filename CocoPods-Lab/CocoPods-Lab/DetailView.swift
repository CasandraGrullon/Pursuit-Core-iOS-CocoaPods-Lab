//
//  DetailView.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/29/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {

    public lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    public lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, userLocationLabel, userBirthdayLabel, userPhoneNumberLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    public lazy var userLocationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    public lazy var userBirthdayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    public lazy var userPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
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
        imageConstraints()
        labelStackConstraint()
    }
    private func imageConstraints() {
        addSubview(userPhoto)
        userPhoto.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.5)
        }
    }
    private func labelStackConstraint() {
        addSubview(labelStack)
        labelStack.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).inset(100)
            make.trailing.leading.equalTo(self).inset(20)
        }
    }

}
