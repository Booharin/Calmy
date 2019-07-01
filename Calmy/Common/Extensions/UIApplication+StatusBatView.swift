//
//  UIApplication+StatusBatView.swift
//  Calmy
//
//  Created by Booharin on 23/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector("statusBar")) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
