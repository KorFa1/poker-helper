//
//  PlayerEnterNameModulePresenter.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol PlayerEnterNameModulePresenterModelInput: AnyObject {
    
}

protocol PlayerEnterNameModulePresenterViewInput: AnyObject {
    func didTapSavePlayerNameButton(_ name: String)
}

// MARK: - PlayerEnterNameModulePresenter
final class PlayerEnterNameModulePresenter {
    // MARK: - Properties
    var model: PlayerEnterNameModuleModelPresenterInput?
    weak var view: PlayerEnterNameModuleViewPresenterInput?
    var moduleManager: ModuleManagerPlayerEnterNameModulePresenterInput?
    
    // MARK: - Init
    init(model: PlayerEnterNameModuleModelPresenterInput, view: PlayerEnterNameModuleViewPresenterInput, moduleManager: ModuleManagerPlayerEnterNameModulePresenterInput) {
        self.model = model
        self.view = view
        self.moduleManager = moduleManager
    }
}

// MARK: - PlayerEnterNameModulePresenterModelInput
extension PlayerEnterNameModulePresenter: PlayerEnterNameModulePresenterModelInput {
    
}

// MARK: - PlayerEnterNameModulePresenterViewInput
extension PlayerEnterNameModulePresenter: PlayerEnterNameModulePresenterViewInput {
    func didTapSavePlayerNameButton(_ name: String) {
        model?.savePlayerName(name)
        if let playerConnectionModule = moduleManager?.createPlayerConnectionModule() {
            view?.navigateToPlayerConnectionModule(playerConnectionModule)
        }
    }
}
