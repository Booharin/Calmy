//
//  ChatMessage.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//
enum ChatMessageType {
    case calmy
    case user
}

struct ChatMessage {
    let text: String
    let type: ChatMessageType
    
    init(text: String, type: ChatMessageType) {
        self.text = text
        self.type = type
    }
}
