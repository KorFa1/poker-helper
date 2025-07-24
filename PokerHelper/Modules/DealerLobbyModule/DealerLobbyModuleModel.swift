//
//  DealerLobbyModuleModel.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol DealerLobbyModuleModelPresenterInput: AnyObject {
    
}

// MARK: - DealerLobbyModuleModel
final class DealerLobbyModuleModel {
    // MARK: - Properties
    weak var presenter: DealerLobbyModulePresenterModelInput?
    var dataManager: DataManagerDealerLobbyModuleModelInput?
    var connectionManager: ConnectionManagerDealerLobbyModuleModelInput?
}

// MARK: - DealerLobbyModuleModelPresenterInput
extension DealerLobbyModuleModel: DealerLobbyModuleModelPresenterInput {
    
}
