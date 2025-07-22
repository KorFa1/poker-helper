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
    func navigateToDealerValidationModule(_ viewController: UIViewController)
    func navigateToPlayerEnterNameModule(_ viewController: UIViewController)
}

// MARK: - RoleSelectionModuleView
final class RoleSelectionModuleView: UIViewController {
    // MARK: - Constants

    // MARK: - Properties
    var presenter: RoleSelectionModulePresenterViewInput?
    
    private let greetingsLabel = UILabel()
    private let dealerButton = UIButton(type: .system)
    private let playerButton = UIButton(type: .system)
    private let developerNameLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
}

// MARK: - UI setup
private extension RoleSelectionModuleView {
    func setupUI() {
        setupBackgroundImage()
        setupGreetingsLabel()
        setupDealerButton()
        setupPlayerButton()
        setupDeveloperNameLabel()
    }
    
    func setupBackgroundImage() {
        if let backgroundImage = UIImage(named: "poker-table-background") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            view.backgroundColor = .green
        }
    }
    
    func setupGreetingsLabel() {
        greetingsLabel.font = .systemFont(ofSize: 40, weight: .bold)
        greetingsLabel.textColor = .white
        greetingsLabel.textAlignment = .center
        greetingsLabel.numberOfLines = 0
        greetingsLabel.text = "Welcome to Poker Helper!"
        view.addSubview(greetingsLabel)
    }
    
    func setupDealerButton() {
        dealerButton.setTitle("I'm a dealer", for: .normal)
        dealerButton.backgroundColor = .red
        dealerButton.setTitleColor(.white, for: .normal)
        dealerButton.titleLabel?.font = .systemFont(ofSize: 25)
        dealerButton.layer.cornerRadius = 10
        dealerButton.addTarget(self, action: #selector(dealerButtonTapped), for: .touchUpInside)
        view.addSubview(dealerButton)
    }
    
    func setupPlayerButton() {
        playerButton.setTitle("I'm a player", for: .normal)
        playerButton.backgroundColor = .black
        playerButton.setTitleColor(.white, for: .normal)
        playerButton.titleLabel?.font = .systemFont(ofSize: 25)
        playerButton.layer.cornerRadius = 10
        playerButton.addTarget(self, action: #selector(playerButtonTapped), for: .touchUpInside)
        view.addSubview(playerButton)
    }
    
    func setupDeveloperNameLabel() {
        developerNameLabel.font = .systemFont(ofSize: 10)
        developerNameLabel.textColor = .white
        developerNameLabel.text = "by Kirill Sofrin"
        view.addSubview(developerNameLabel)
    }
}

// MARK: - Constraints
private extension RoleSelectionModuleView {
    func setupConstraints() {
        setupGreetingsLabelConstraints()
        setupDealerButtonConstraints()
        setupPlayerButtonConstraints()
        setupDeveloperNameLabelConstraints()
    }
    
    func setupGreetingsLabelConstraints() {
        greetingsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupDealerButtonConstraints() {
        dealerButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(view.snp.centerX).offset(-10)
            make.height.equalTo(100)
        }
    }
    
    func setupPlayerButtonConstraints() {
        playerButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(view.snp.centerX).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
    }
    
    func setupDeveloperNameLabelConstraints() {
        developerNameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - Actions
private extension RoleSelectionModuleView {
    @objc func dealerButtonTapped() {
        presenter?.didTapDealerButton()
    }
    
    @objc func playerButtonTapped() {
        presenter?.didTapPlayerButton()
    }
}

// MARK: - RoleSelectionModuleViewPresenterInput
extension RoleSelectionModuleView: RoleSelectionModuleViewPresenterInput {
    func navigateToDealerValidationModule(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToPlayerEnterNameModule(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
