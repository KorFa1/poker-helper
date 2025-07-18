//
//  PlayerEnterNameModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol PlayerEnterNameModuleViewPresenterInput: AnyObject {
    
}

// MARK: - PlayerEnterNameModuleView
final class PlayerEnterNameModuleView: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - PlayerEnterNameModuleViewPresenterInput
extension PlayerEnterNameModuleView: PlayerEnterNameModuleViewPresenterInput {
    
}
