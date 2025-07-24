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

protocol DataManagerPlayerConnectionModuleModelInput {
    func getPlayerName(completion: @escaping (String) -> Void)
}

protocol DataManagerDealerLobbyModuleModelInput {
    func saveDealerLobbyName(_ name: String)
}

// MARK: - DataManager
final class DataManager {
    // MARK: - Properties
    private let playerNameKey: String = "playerName"
    private let dealerLobbyNameKey: String = "dealerLobbyName"
}

// MARK: - DataManagerPlayerEnterNameModuleModelInput
extension DataManager: DataManagerPlayerEnterNameModuleModelInput {
    func savePlayerName(_ name: String) {
        UserDefaults.standard.set(name, forKey: playerNameKey)
    }
}

// MARK: - DataManagerPlayerConnectionModuleModelInput
extension DataManager: DataManagerPlayerConnectionModuleModelInput {
    func getPlayerName(completion: @escaping (String) -> Void) {
        let name = UserDefaults.standard.string(forKey: playerNameKey) ?? ""
        DispatchQueue.main.async {
            completion(name)
        }
    }
}

// MARK: - DataManagerDealerLobbyModuleModelInput
extension DataManager: DataManagerDealerLobbyModuleModelInput {
    func saveDealerLobbyName(_ name: String) {
        UserDefaults.standard.set(name, forKey: dealerLobbyNameKey)
    }
}
