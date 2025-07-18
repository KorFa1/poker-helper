//
//  DealerGameModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol DealerGameModuleViewPresenterInput: AnyObject {
    
}

// MARK: - DealerGameModuleView
final class DealerGameModuleView: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - DealerGameModuleViewPresenterInput
extension DealerGameModuleView: DealerGameModuleViewPresenterInput {
    
}
