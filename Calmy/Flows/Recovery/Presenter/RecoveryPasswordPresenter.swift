//
//  RecoveryPasswordPresenter.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//
protocol RecoveryPasswordPresenterInput {
    
}

protocol RecoveryPasswordPresenterOutput: class {
    
}

class RecoveryPasswordPresenter: RecoveryPasswordPresenterInput {
    weak var view: RecoveryPasswordPresenterOutput?
}
