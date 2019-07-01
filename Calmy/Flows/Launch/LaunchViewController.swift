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
        let colorTop = #colorLiteral(red: 0.9371172786, green: 0.9054889083, blue: 0.9954904914, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.6727065444, green: 0.6017684937, blue: 0.7922822237, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        
        return gradientLayer
    }
}
