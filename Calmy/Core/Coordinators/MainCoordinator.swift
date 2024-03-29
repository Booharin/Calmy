//
//  MainCoordinator.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    var rootController: MainTabBarController?
    var onFinishFlow: (() -> Void)?
    
    override func start() {
        showMain()
    }
    
    private func showMain() {
        if let mainController = MainTabBarInitializer().initModule() {
            self.rootController = mainController
            setAsRoot(mainController)
        }
    }
}
