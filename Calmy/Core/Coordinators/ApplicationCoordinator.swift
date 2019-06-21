//
//  ApplicationCoordinator.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//
import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    override func start() {
        showLaunch()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.toMain()
        })
    }
    
    private func showLaunch() {
        let controller = UIStoryboard(name: "LaunchScreen", bundle: nil)
            .instantiateViewController(LaunchViewController.self)
        setAsRoot(controller)
    }
    
    private func toMain() {
        let coordinator = MainCoordinator()
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func toAuth() {
        let coordinator = AuthCoordinator()
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
}

