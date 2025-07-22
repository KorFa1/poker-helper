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

protocol ModuleManagerPlayerConnectionModulePresenterInput: AnyObject {
    func createPlayerGameModule() -> UIViewController
}

protocol ModuleManagerDealerValidationModulePresenterInput: AnyObject {
    func createDealerLobbyModule() -> UIViewController
}

protocol ModuleManagerDealerLobbyModulePresenterInput: AnyObject {
    func createDealerGameModule() -> UIViewController
}

// MARK: - ModuleManager
final class ModuleManager {
    // MARK: - Properties
    private let dataManager: DataManagerPlayerEnterNameModuleModelInput = DataManager()
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
        let playerConnectionModuleView: PlayerConnectionModuleViewPresenterInput = PlayerConnectionModuleView()
        
        return playerConnectionModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerPlayerConnectionModulePresenterInput
extension ModuleManager: ModuleManagerPlayerConnectionModulePresenterInput {
    func createPlayerGameModule() -> UIViewController {
        let playerGameModuleView: PlayerGameModuleViewPresenterInput = PlayerGameModuleView()
        
        return playerGameModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerDealerValidationModulePresenterInput
extension ModuleManager: ModuleManagerDealerValidationModulePresenterInput {
    func createDealerLobbyModule() -> UIViewController {
        let dealerLobbyModuleView: DealerLobbyModuleViewPresenterInput = DealerLobbyModuleView()
        
        return dealerLobbyModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerDealerLobbyModulePresenterInput
extension ModuleManager: ModuleManagerDealerLobbyModulePresenterInput {
    func createDealerGameModule() -> UIViewController {
        let dealerGameModuleView: DealerGameModuleViewPresenterInput = DealerGameModuleView()
        
        return dealerGameModuleView as! UIViewController
    }
}
