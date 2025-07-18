//
//  PlayerConnectionModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol PlayerConnectionModuleViewPresenterInput: AnyObject {
    
}

// MARK: - PlayerConnectionModuleView
final class PlayerConnectionModuleView: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - PlayerConnectionModuleViewPresenterInput
extension PlayerConnectionModuleView: PlayerConnectionModuleViewPresenterInput {
    
}
