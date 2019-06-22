//
//  ChatInitializer.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

class ChatInitializer {
    func initModule() -> ChatViewController {
        let controller = ChatViewController()
        let presenter = ChatPresenter()
        let dataStorage = ChatDataStorage()
        presenter.dataStorage = dataStorage
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
}
