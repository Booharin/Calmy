//
//  ChatPresenter.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

protocol ChatPresenterInput {
    var messages: [ChatMessage] { get }
    func inComingMessage()
    func getLastMessageRow() -> Int
    func createCustomStatusBarView()
    func removeGradientLayerFromStatusBar()
}

protocol ChatPresenterOutput: class {
    func didUpdateMessages()
}

class ChatPresenter: ChatPresenterInput {
    weak var view: ChatPresenterOutput!
    var dataStorage: ChatDataStorage!
    private var gradientLayer: CAGradientLayer?
    private let statusBarViewHeight: CGFloat = 100
    
    var messages: [ChatMessage] {
        return dataStorage.messages
    }
    
    func inComingMessage() {
        dataStorage.messages.append(ChatMessage(text: "It's ok, it's checking, how you mood?", type: .calmy))
    }
    
    func getLastMessageRow() -> Int {
        let count = dataStorage.messages.count - 1
        return count < 1 ? 0 : count
    }
    
    func createCustomStatusBarView() {
        let colorTop = Constants.Colors.backgroundChatColor.cgColor
        let colorBottom = Constants.Colors.backgroundChatColor.withAlphaComponent(0.0).cgColor
        
        guard gradientLayer == nil else { return }
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [colorTop, colorBottom]
        gradientLayer?.locations = [0.0, 1.0]
        gradientLayer?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: statusBarViewHeight)
        UIApplication.shared.statusBarView?.layer.insertSublayer(gradientLayer ?? CAGradientLayer(), at: 0)
    }
    
    func removeGradientLayerFromStatusBar() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
    }
}
