//
//  PlayerConnectionModulePresenter.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol PlayerConnectionModulePresenterModelInput: AnyObject {
    
}

protocol PlayerConnectionModulePresenterViewInput: AnyObject {
    
}

// MARK: - PlayerConnectionModulePresenter
final class PlayerConnectionModulePresenter {
    // MARK: - Properties
    var model: PlayerConnectionModuleModelPresenterInput?
    weak var view: PlayerConnectionModuleViewPresenterInput?
    var moduleManager: ModuleManagerPlayerConnectionModulePresenterInput?
    
    // MARK: - Init
    init(model: PlayerConnectionModuleModelPresenterInput, view: PlayerConnectionModuleViewPresenterInput, moduleManager: ModuleManagerPlayerConnectionModulePresenterInput) {
        self.model = model
        self.view = view
        self.moduleManager = moduleManager
    }
}

// MARK: - PlayerConnectionModulePresenterModelInput
extension PlayerConnectionModulePresenter: PlayerConnectionModulePresenterModelInput {
    
}

// MARK: - PlayerConnectionModulePresenterViewInput
extension PlayerConnectionModulePresenter: PlayerConnectionModulePresenterViewInput {
    
}
