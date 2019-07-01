//
//  AuthViewController.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    var onRecover: (() -> Void)?
    var onLogin: (() -> Void)?
    var presenter: AuthPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension AuthViewController: AuthPresenterOutput {
    
}
