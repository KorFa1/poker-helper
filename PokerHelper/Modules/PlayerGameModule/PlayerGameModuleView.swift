//
//  PlayerGameModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol PlayerGameModuleViewPresenterInput: AnyObject {
    
}

// MARK: - PlayerGameModuleView
final class PlayerGameModuleView: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - PlayerGameModuleViewPresenterInput
extension PlayerGameModuleView: PlayerGameModuleViewPresenterInput {
    
}
