//
//  DealerLobbyModulePresenter.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol DealerLobbyModulePresenterModelInput: AnyObject {
    
}

protocol DealerLobbyModulePresenterViewInput: AnyObject {
    
}

// MARK: - DealerLobbyModulePresenter
final class DealerLobbyModulePresenter {
    // MARK: - Properties
    var model: DealerLobbyModuleModelPresenterInput?
    weak var view: DealerLobbyModuleViewPresenterInput?
    var moduleManager: ModuleManagerDealerLobbyModulePresenterInput?
    
    // MARK: - Init
    init(model: DealerLobbyModuleModelPresenterInput, view: DealerLobbyModuleViewPresenterInput, moduleManager: ModuleManagerDealerLobbyModulePresenterInput) {
        self.model = model
        self.view = view
        self.moduleManager = moduleManager
    }
}

// MARK: - DealerLobbyModulePresenterModelInput
extension DealerLobbyModulePresenter: DealerLobbyModulePresenterModelInput {
    
}

// MARK: - DealerLobbyModulePresenterViewInput
extension DealerLobbyModulePresenter: DealerLobbyModulePresenterViewInput {
    
}
