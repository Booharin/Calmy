//
//  ChatPresenter.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import Foundation

protocol ChatPresenterInput {
    var messages: [ChatMessage] { get }
    func inComingMessage()
}

protocol ChatPresenterOutput: class {
    func didUpdateMessages()
}

class ChatPresenter: ChatPresenterInput {
    weak var view: ChatPresenterOutput!
    var dataStorage: ChatDataStorage!
    
    var messages: [ChatMessage] {
        return dataStorage.messages
    }
    
    func inComingMessage() {
        dataStorage.messages.append(ChatMessage(text: "It's ok, it's checking, how you mood?", type: .calmy))
    }
}
