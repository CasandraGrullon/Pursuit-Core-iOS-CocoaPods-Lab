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
    
    override func loadView() {
        view = usersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

