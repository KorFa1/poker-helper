//
//  RoleSelectionModulePresenter.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol RoleSelectionModulePresenterModelInput: AnyObject {
    
}

protocol RoleSelectionModulePresenterViewInput: AnyObject {
    func didTapDealerButton()
    func didTapPlayerButton()
}

// MARK: - RoleSelectionModulePresenter
final class RoleSelectionModulePresenter {
    // MARK: - Properties
    var model: RoleSelectionModuleModelPresenterInput?
    weak var view: RoleSelectionModuleViewPresenterInput?
    var moduleManager: ModuleManagerRoleSelectionModulePresenterInput?
    
    // MARK: - Init
    init(model: RoleSelectionModuleModelPresenterInput, view: RoleSelectionModuleViewPresenterInput, moduleManager: ModuleManagerRoleSelectionModulePresenterInput) {
        self.model = model
        self.view = view
        self.moduleManager = moduleManager
    }
}

// MARK: - RoleSelectionModulePresenterModelInput
extension RoleSelectionModulePresenter: RoleSelectionModulePresenterModelInput {

}

// MARK: - RoleSelectionModulePresenterViewInput
extension RoleSelectionModulePresenter: RoleSelectionModulePresenterViewInput {
    func didTapDealerButton() {
        if let dealerValidationModule = moduleManager?.createDealerValidationModule() {
            view?.navigateToDealerValidationModule(dealerValidationModule)
        }
    }
    
    func didTapPlayerButton() {
        if let playerEnterNameModule = moduleManager?.createPlayerEnterNameModule() {
            view?.navigateToPlayerEnterNameModule(playerEnterNameModule)
        }
    }
}
