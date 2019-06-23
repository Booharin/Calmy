//
//  MainTabBarInitializer.swift
//  Calmy
//
//  Created by Booharin on 23/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

class MainTabBarInitializer {
    func initModule() -> MainTabBarController? {
        let rootController = MainTabBarController()
        
        let chatViewController = ChatInitializer().initModule()
        guard let image = UIImage(named: "calmy_face_icon") else { return nil }
        
        chatViewController.tabBarItem = UITabBarItem(title: "Calmy", image: image.withRenderingMode(.alwaysTemplate), tag: 0)
        chatViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        rootController.viewControllers = [chatViewController]
        rootController.tabBar.tintColor = Constants.Colors.tabBarTintColor
        
        return rootController
    }
}
