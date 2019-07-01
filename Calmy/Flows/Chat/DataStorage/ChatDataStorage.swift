//
//  ChatDataStorage.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

class ChatDataStorage {
    var messages = [
        ChatMessage(text: "Hello, bro, how are you?", type: .calmy),
        ChatMessage(text: "Hello, calmy, I'm fine.", type: .user)
    ]
    
    var buttons = [
        ChatButton(text: "Ok, I'm done", type: .action),
        ChatButton(text: "All right, let's try", type: .action)
    ]
}
