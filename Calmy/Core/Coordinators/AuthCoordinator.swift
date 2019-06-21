//
//  AuthCoordinator.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

final class AuthCoordinator: BaseCoordinator {
    var rootController: MainNavigationController?
    var onFinishFlow: (() -> Void)?
    
    override func start() {
        showLoginModule()
    }
    
    private func showLoginModule() {
        let controller = AuthInitializer().initModule()
        
        controller.onRecover = { [weak self] in
            self?.showRecoverModule()
        }
        
        controller.onLogin = { [weak self] in
            self?.onFinishFlow?()
        }
        
        let rootController = MainNavigationController(rootViewController: controller)
        setAsRoot(rootController)
        self.rootController = rootController
    }
    
    private func showRecoverModule() {
        let controller = RecoveryPasswordInitializer().initModule()
        rootController?.pushViewController(controller, animated: true)
    }
}
