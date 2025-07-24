//
//  ModuleManager.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit

// MARK: - Protocols
protocol ModuleManagerSceneDelegateInput: AnyObject {
    func createRoleSelectionModule() -> UIViewController
}

protocol ModuleManagerRoleSelectionModulePresenterInput: AnyObject {
    func createPlayerEnterNameModule() -> UIViewController
    func createDealerValidationModule() -> UIViewController
}

protocol ModuleManagerPlayerEnterNameModulePresenterInput: AnyObject {
    func createPlayerConnectionModule() -> UIViewController
}

protocol ModuleManagerDealerValidationModulePresenterInput: AnyObject {
    func createDealerLobbyModule() -> UIViewController
}

protocol ModuleManagerPlayerConnectionModulePresenterInput: AnyObject {
    func createPlayerGameModule() -> UIViewController
}

protocol ModuleManagerDealerLobbyModulePresenterInput: AnyObject {
    func createDealerGameModule() -> UIViewController
}

// MARK: - ModuleManager
final class ModuleManager {
    // MARK: - Properties
    private let dataManager: DataManagerPlayerEnterNameModuleModelInput & DataManagerPlayerConnectionModuleModelInput & DataManagerDealerLobbyModuleModelInput = DataManager()
    private let connectionManager: ConnectionManagerPlayerConnectionModuleModelInput & ConnectionManagerPlayerGameModuleModelInput & ConnectionManagerDealerLobbyModuleModelInput & ConnectionManagerDealerGameModuleModelInput = ConnectionManager()
}

// MARK: - ModuleManagerSceneDelegateInput
extension ModuleManager: ModuleManagerSceneDelegateInput {
    func createRoleSelectionModule() -> UIViewController {
        let roleSelectionModuleModel: RoleSelectionModuleModelPresenterInput = RoleSelectionModuleModel()
        let roleSelectionModuleView: RoleSelectionModuleViewPresenterInput = RoleSelectionModuleView()
        let roleSelectionModulePresenter: RoleSelectionModulePresenterModelInput & RoleSelectionModulePresenterViewInput = RoleSelectionModulePresenter(model: roleSelectionModuleModel, view: roleSelectionModuleView, moduleManager: self)
        
        (roleSelectionModuleModel as! RoleSelectionModuleModel).presenter = roleSelectionModulePresenter
        (roleSelectionModuleView as! RoleSelectionModuleView).presenter = roleSelectionModulePresenter
        
        return roleSelectionModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerRoleSelectionModulePresenterInput
extension ModuleManager: ModuleManagerRoleSelectionModulePresenterInput {
    func createPlayerEnterNameModule() -> UIViewController {
        let playerEnterNameModuleModel: PlayerEnterNameModuleModelPresenterInput = PlayerEnterNameModuleModel()
        let playerEnterNameModuleView: PlayerEnterNameModuleViewPresenterInput = PlayerEnterNameModuleView()
        let playerEnterNameModulePresenter: PlayerEnterNameModulePresenterModelInput & PlayerEnterNameModulePresenterViewInput = PlayerEnterNameModulePresenter(model: playerEnterNameModuleModel, view: playerEnterNameModuleView, moduleManager: self)
        
        (playerEnterNameModuleModel as! PlayerEnterNameModuleModel).presenter = playerEnterNameModulePresenter
        (playerEnterNameModuleModel as! PlayerEnterNameModuleModel).dataManager = dataManager
        (playerEnterNameModuleView as! PlayerEnterNameModuleView).presenter = playerEnterNameModulePresenter
        
        return playerEnterNameModuleView as! UIViewController
    }
    
    func createDealerValidationModule() -> UIViewController {
        let dealerValidationModuleModel: DealerValidationModuleModelPresenterInput = DealerValidationModuleModel()
        let dealerValidationModuleView: DealerValidationModuleViewPresenterInput = DealerValidationModuleView()
        let dealerValidationModulePresenter: DealerValidationModulePresenterModelInput & DealerValidationModulePresenterViewInput = DealerValidationModulePresenter(model: dealerValidationModuleModel, view: dealerValidationModuleView, moduleManager: self)
        let validationManager: ValidationManagerDealerValidationModuleModelInput = ValidationManager()
        
        (dealerValidationModuleModel as! DealerValidationModuleModel).presenter = dealerValidationModulePresenter
        (dealerValidationModuleModel as! DealerValidationModuleModel).validationManager = validationManager
        (dealerValidationModuleView as! DealerValidationModuleView).presenter = dealerValidationModulePresenter
        
        return dealerValidationModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerPlayerEnterNameModulePresenterInput
extension ModuleManager: ModuleManagerPlayerEnterNameModulePresenterInput {
    func createPlayerConnectionModule() -> UIViewController {
        let playerConnectionModuleModel: PlayerConnectionModuleModelPresenterInput = PlayerConnectionModuleModel()
        let playerConnectionModuleView: PlayerConnectionModuleViewPresenterInput = PlayerConnectionModuleView()
        let playerConnectionModulePresenter: PlayerConnectionModulePresenterModelInput & PlayerConnectionModulePresenterViewInput = PlayerConnectionModulePresenter(model: playerConnectionModuleModel, view: playerConnectionModuleView, moduleManager: self)
        
        (playerConnectionModuleModel as! PlayerConnectionModuleModel).presenter = playerConnectionModulePresenter
        (playerConnectionModuleModel as! PlayerConnectionModuleModel).dataManager = dataManager
        (playerConnectionModuleModel as! PlayerConnectionModuleModel).connectionManager = connectionManager
        (playerConnectionModuleView as! PlayerConnectionModuleView).presenter = playerConnectionModulePresenter
        
        return playerConnectionModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerDealerValidationModulePresenterInput
extension ModuleManager: ModuleManagerDealerValidationModulePresenterInput {
    func createDealerLobbyModule() -> UIViewController {
        let dealerLobbyModuleModel: DealerLobbyModuleModelPresenterInput = DealerLobbyModuleModel()
        let dealerLobbyModuleView: DealerLobbyModuleViewPresenterInput = DealerLobbyModuleView()
        let dealerLobbyModulePresenter: DealerLobbyModulePresenterModelInput & DealerLobbyModulePresenterViewInput = DealerLobbyModulePresenter(model: dealerLobbyModuleModel, view: dealerLobbyModuleView, moduleManager: self)
        
        (dealerLobbyModuleModel as! DealerLobbyModuleModel).presenter = dealerLobbyModulePresenter
        (dealerLobbyModuleModel as! DealerLobbyModuleModel).dataManager = dataManager
        (dealerLobbyModuleModel as! DealerLobbyModuleModel).connectionManager = connectionManager
        (dealerLobbyModuleView as! DealerLobbyModuleView).presenter = dealerLobbyModulePresenter
        
        return dealerLobbyModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerPlayerConnectionModulePresenterInput
extension ModuleManager: ModuleManagerPlayerConnectionModulePresenterInput {
    func createPlayerGameModule() -> UIViewController {
        let playerGameModuleView: PlayerGameModuleViewPresenterInput = PlayerGameModuleView()
        
        return playerGameModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerDealerLobbyModulePresenterInput
extension ModuleManager: ModuleManagerDealerLobbyModulePresenterInput {
    func createDealerGameModule() -> UIViewController {
        let dealerGameModuleView: DealerGameModuleViewPresenterInput = DealerGameModuleView()
        
        return dealerGameModuleView as! UIViewController
    }
}
