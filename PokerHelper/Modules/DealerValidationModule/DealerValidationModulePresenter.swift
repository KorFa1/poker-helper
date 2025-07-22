//
//  DealerValidationModulePresenter.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 19.07.2025.
//

import Foundation

// MARK: - Protocols
protocol DealerValidationModulePresenterModelInput: AnyObject {
    func didValidateDealerPassword(result: Bool)
}

protocol DealerValidationModulePresenterViewInput: AnyObject {
    func didTapConfirmPasswordButton(_ password: String)
}

// MARK: - DealerValidationModulePresenter
final class DealerValidationModulePresenter {
    // MARK: - Properties
    var model: DealerValidationModuleModelPresenterInput?
    weak var view: DealerValidationModuleViewPresenterInput?
    var moduleManager: ModuleManagerDealerValidationModulePresenterInput?
    
    // MARK: - Init
    init(model: DealerValidationModuleModelPresenterInput, view: DealerValidationModuleViewPresenterInput, moduleManager: ModuleManagerDealerValidationModulePresenterInput) {
        self.model = model
        self.view = view
        self.moduleManager = moduleManager
    }
}

// MARK: - DealerValidationModulePresenterModelInput
extension DealerValidationModulePresenter: DealerValidationModulePresenterModelInput {
    func didValidateDealerPassword(result: Bool) {
        if result, let dealerLobbyModule = moduleManager?.createDealerLobbyModule() {
            view?.navigateToDealerLobbyModule(dealerLobbyModule)
        } else {
            view?.showErrorAlert(message: "Wrong password!")
        }
    }
}

// MARK: - DealerValidationModulePresenterViewInput
extension DealerValidationModulePresenter: DealerValidationModulePresenterViewInput {
    func didTapConfirmPasswordButton(_ password: String) {
        model?.validateDealerPassword(password)
    }
}
