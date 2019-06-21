//
//  AuthInitializer.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

class AuthInitializer {
    func initModule() -> AuthViewController {
        let controller = AuthViewController(nibName: "AuthViewController", bundle: nil)
        let presenter = AuthPresenter()
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
}
