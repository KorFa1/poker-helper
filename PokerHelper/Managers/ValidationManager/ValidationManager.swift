//
//  ValidationManager.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 19.07.2025.
//

import Foundation

// MARK: - Protocols
protocol ValidationManagerDealerValidationModuleModelInput {
    func validatePassword(_ password: String, completion: @escaping (Bool) -> Void)
}

// MARK: - ValidationManager
final class ValidationManager {
    private let validationCode = "Я "
}

// MARK: - ValidationManagerDealerValidationModuleModelInput
extension ValidationManager: ValidationManagerDealerValidationModuleModelInput {
    func validatePassword(_ password: String, completion: @escaping (Bool) -> Void) {
        if password == validationCode {
            DispatchQueue.main.async {
                completion(true)
            }
        } else {
            DispatchQueue.main.async {
                completion(false)
            }
        }
    }
}
