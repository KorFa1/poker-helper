//
//  DataManager.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 22.07.2025.
//

import Foundation

// MARK: - Protocols
protocol DataManagerPlayerEnterNameModuleModelInput {
    func savePlayerName(_ name: String)
}

// MARK: - DataManager
final class DataManager {
    // MARK: - Properties
    private let userDefaultsKey: String = "playerName"
}

// MARK: - DataManagerPlayerEnterNameModuleModelInput
extension DataManager: DataManagerPlayerEnterNameModuleModelInput {
    func savePlayerName(_ name: String) {
        UserDefaults.standard.set(name, forKey: userDefaultsKey)
    }
}
