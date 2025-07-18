//
//  RoleSelectionModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol RoleSelectionModuleViewPresenterInput: AnyObject {
    
}

// MARK: - RoleSelectionModuleView
final class RoleSelectionModuleView: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - RoleSelectionModuleViewPresenterInput
extension RoleSelectionModuleView: RoleSelectionModuleViewPresenterInput {
    
}
