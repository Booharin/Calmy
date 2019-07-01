//
//  RecoveryPasswordInitializer.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

class RecoveryPasswordInitializer {
    func initModule() -> RecoveryPasswordViewController {
        let controller = RecoveryPasswordViewController(nibName: "RecoveryPasswordViewController",
                                                        bundle: nil)
        let presenter = RecoveryPasswordPresenter()
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
}
