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
    func createDealerLobbyModule() -> UIViewController
}

protocol ModuleManagerPlayerEnterNameModulePresenterInput: AnyObject {
    func createPlayerConnectionModule() -> UIViewController
}

protocol ModuleManagerPlayerConnectionModulePresenterInput: AnyObject {
    func createPlayerGameModule() -> UIViewController
}

protocol ModuleManagerDealerLobbyModulePresenterInput: AnyObject {
    func createDealerGameModule() -> UIViewController
}

// MARK: - ModuleManager
final class ModuleManager {

}

// MARK: - ModuleManagerSceneDelegateInput
extension ModuleManager: ModuleManagerSceneDelegateInput {
    func createRoleSelectionModule() -> UIViewController {
        let roleSelectionModuleView: RoleSelectionModuleViewPresenterInput = RoleSelectionModuleView()
        
        return roleSelectionModuleView as! UIViewController
    }
}

// MARK: - ModuleManagerRoleSelectionModulePresenterInput
extension ModuleManager: ModuleManagerRoleSelectionModulePresenterInput {
    func createPlayerEnterNameModule() -> UIViewController {
        let playerEnterNameModuleView: PlayerEnterNameModuleViewPresenterInput = PlayerEnterNameModuleView()
        
        return playerEnterNameModuleView as! UIViewController
    }
    
    func createDealerLobbyModule() -> UIViewController {
        let dealerLobbyModuleView: DealerLobbyModuleViewPresenterInput = DealerLobbyModuleView()
        
        return dealerLobbyModuleView as! UIViewController
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

// MARK: - ModuleManagerDealerLobbyModulePresenterInput
extension ModuleManager: ModuleManagerDealerLobbyModulePresenterInput {
    func createDealerGameModule() -> UIViewController {
        let dealerGameModuleView: DealerGameModuleViewPresenterInput = DealerGameModuleView()
        
        return dealerGameModuleView as! UIViewController
    }
}
