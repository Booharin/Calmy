//
//  LaunchViewController.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        let backgroundLayer = getGradientLayer()
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    private func getGradientLayer() -> CAGradientLayer {
        let colorTop = #colorLiteral(red: 0.9881975055, green: 0.8733022213, blue: 0.7819040418, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.741050005, green: 0.542275548, blue: 0.5064015388, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        
        return gradientLayer
    }
}
