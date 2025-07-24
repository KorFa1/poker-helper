//
//  PlayerConnectionModuleModel.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol PlayerConnectionModuleModelPresenterInput: AnyObject {
    
}

// MARK: - PlayerConnectionModuleModel
final class PlayerConnectionModuleModel {
    // MARK: - Properties
    weak var presenter: PlayerConnectionModulePresenterModelInput?
    var dataManager: DataManagerPlayerConnectionModuleModelInput?
    var connectionManager: ConnectionManagerPlayerConnectionModuleModelInput?
}

// MARK: - PlayerConnectionModuleModelPresenterInput
extension PlayerConnectionModuleModel: PlayerConnectionModuleModelPresenterInput {
    
}
