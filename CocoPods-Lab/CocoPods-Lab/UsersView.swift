//
//  UsersView.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import SnapKit

class UsersView: UIView {

    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return cv
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
        collectionviewConstraints()
    }
    
    private func collectionviewConstraints(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.top.trailing.leading.equalTo(self)
        }
    }

}
