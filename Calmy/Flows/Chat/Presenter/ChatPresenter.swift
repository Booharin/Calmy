//
//  ChatPresenter.swift
//  Calmy
//
//  Created by Booharin on 21/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import Foundation

protocol ChatPresenterInput {
    
}

protocol ChatPresenterOutput: class {
    
}

class ChatPresenter: ChatPresenterInput {
    weak var view: ChatPresenterOutput?
}
