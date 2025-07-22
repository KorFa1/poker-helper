//
//  PlayerEnterNameModuleModel.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import Foundation

// MARK: - Protocols
protocol PlayerEnterNameModuleModelPresenterInput: AnyObject {
    func savePlayerName(_ name: String)
}

// MARK: - PlayerEnterNameModuleModel
final class PlayerEnterNameModuleModel {
    // MARK: - Properties
    weak var presenter: PlayerEnterNameModulePresenterModelInput?
    var dataManager: DataManagerPlayerEnterNameModuleModelInput?
}

// MARK: - PlayerEnterNameModuleModelPresenterInput
extension PlayerEnterNameModuleModel: PlayerEnterNameModuleModelPresenterInput {
    func savePlayerName(_ name: String) {
        dataManager?.savePlayerName(name)
    }
}
