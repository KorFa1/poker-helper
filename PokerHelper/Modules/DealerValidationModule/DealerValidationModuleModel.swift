//
//  DealerValidationModuleModel.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 19.07.2025.
//

import Foundation

// MARK: - Protocols
protocol DealerValidationModuleModelPresenterInput: AnyObject {
    func validateDealerPassword(_ password: String)
}

// MARK: - DealerValidationModuleModel
final class DealerValidationModuleModel {
    // MARK: - Properties
    weak var presenter: DealerValidationModulePresenterModelInput?
    var validationManager: ValidationManagerDealerValidationModuleModelInput?
}

// MARK: - DealerValidationModuleModelPresenterInput
extension DealerValidationModuleModel: DealerValidationModuleModelPresenterInput {
    func validateDealerPassword(_ password: String) {
        validationManager?.validatePassword(password) { [weak self] result in
            self?.presenter?.didValidateDealerPassword(result: result)
        }
    }
}
