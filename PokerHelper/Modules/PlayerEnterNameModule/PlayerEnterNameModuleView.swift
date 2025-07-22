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
    func navigateToPlayerConnectionModule(_ viewController: UIViewController)
}

// MARK: - PlayerEnterNameModuleView
final class PlayerEnterNameModuleView: UIViewController {
    // MARK: - Constants

    // MARK: - Properties
    var presenter: PlayerEnterNameModulePresenterViewInput?
    
    private let enterPlayerNameLabel = UILabel()
    private let enterPlayerNameTextField = UITextField()
    private let savePlayerNameButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        addGestureRecognizer()
    }
}

// MARK: - UI setup
private extension PlayerEnterNameModuleView {
    func setupUI() {
        setupBackgroundImage()
        setupEnterPlayerNameLabel()
        setupEnterPlayerNameTextField()
        setupSavePlayerNameButton()
    }
    
    func setupBackgroundImage() {
        if let backgroundImage = UIImage(named: "poker-table-background") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            view.backgroundColor = .green
        }
    }
    
    func setupEnterPlayerNameLabel() {
        enterPlayerNameLabel.font = .systemFont(ofSize: 40, weight: .bold)
        enterPlayerNameLabel.textColor = .white
        enterPlayerNameLabel.textAlignment = .center
        enterPlayerNameLabel.numberOfLines = 0
        enterPlayerNameLabel.text = "Enter your name"
        view.addSubview(enterPlayerNameLabel)
    }
    
    func setupEnterPlayerNameTextField() {
        enterPlayerNameTextField.borderStyle = .roundedRect
        enterPlayerNameTextField.font = .systemFont(ofSize: 25)
        enterPlayerNameTextField.delegate = self
        enterPlayerNameTextField.addTarget(self, action: #selector(enterPlayerNameTextFieldDidChange), for: .editingChanged)
        view.addSubview(enterPlayerNameTextField)
    }
    
    func setupSavePlayerNameButton() {
        savePlayerNameButton.setTitle("Confirm", for: .normal)
        savePlayerNameButton.backgroundColor = .red
        savePlayerNameButton.setTitleColor(.white, for: .normal)
        savePlayerNameButton.titleLabel?.font = .systemFont(ofSize: 25)
        savePlayerNameButton.layer.cornerRadius = 10
        savePlayerNameButton.isEnabled = false
        savePlayerNameButton.addTarget(self, action: #selector(savePlayerNameButtonTapped), for: .touchUpInside)
        view.addSubview(savePlayerNameButton)
    }
}

// MARK: - Constraints
private extension PlayerEnterNameModuleView {
    func setupConstraints() {
        setupEnterPlayerNameLabelConstraints()
        setupEnterPlayerNameTextFieldConstraints()
        setupSavePlayerNameButtonConstraints()
    }
    
    func setupEnterPlayerNameLabelConstraints() {
        enterPlayerNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupEnterPlayerNameTextFieldConstraints() {
        enterPlayerNameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(50)
        }
    }
    
    func setupSavePlayerNameButtonConstraints() {
        savePlayerNameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(100)
        }
    }
}

// MARK: - Actions
private extension PlayerEnterNameModuleView {
    @objc func enterPlayerNameTextFieldDidChange() {
        updateSavePlayerNameButtonState()
    }
    
    @objc func savePlayerNameButtonTapped() {
        let playerName = enterPlayerNameTextField.text ?? ""
        presenter?.didTapSavePlayerNameButton(playerName)
    }
    
    @objc func hideKeyboard() {
        enterPlayerNameTextField.resignFirstResponder()
    }
}

// MARK: - Register savePlayerNameButton state
private extension PlayerEnterNameModuleView {
    func updateSavePlayerNameButtonState() {
        let isEnterPlayerNameTextFieldFilled = !(enterPlayerNameTextField.text ?? "").isEmpty
        savePlayerNameButton.isEnabled = isEnterPlayerNameTextFieldFilled
        savePlayerNameButton.backgroundColor = isEnterPlayerNameTextFieldFilled ? .green : .red
    }
}

// MARK: - UITextFieldDelegate
extension PlayerEnterNameModuleView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Helpers
private extension PlayerEnterNameModuleView {
    func addGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - PlayerEnterNameModuleViewPresenterInput
extension PlayerEnterNameModuleView: PlayerEnterNameModuleViewPresenterInput {
    func navigateToPlayerConnectionModule(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
