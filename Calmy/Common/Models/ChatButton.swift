//
//  ChatButton.swift
//  Calmy
//
//  Created by Booharin on 26/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//
enum ChatButtonType {
    case action
}

struct ChatButton {
    let text: String
    let type: ChatButtonType
    
    init(text: String, type: ChatButtonType) {
        self.text = text
        self.type = type
    }
}
