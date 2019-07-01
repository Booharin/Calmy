//
//  CalmyViewCell.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

class CalmyViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    private var shadowLayer: CAShapeLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = Constants.Colors.calmyMessageBorderColor.cgColor
        containerView.layer.borderWidth = 0.25
        selectionStyle = .none
    }
}
