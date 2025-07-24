//
//  DealerLobbyModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol DealerLobbyModuleViewPresenterInput: AnyObject {
    
}

// MARK: - DealerLobbyModuleView
final class DealerLobbyModuleView: UIViewController {
    // MARK: - Constants

    // MARK: - Properties
    var presenter: DealerLobbyModulePresenterViewInput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - DealerLobbyModuleViewPresenterInput
extension DealerLobbyModuleView: DealerLobbyModuleViewPresenterInput {
    
}
