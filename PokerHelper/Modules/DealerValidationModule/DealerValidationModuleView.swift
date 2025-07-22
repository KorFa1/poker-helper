//
//  DealerValidationModuleView.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 19.07.2025.
//

import UIKit
import SnapKit

// MARK: - Protocols
protocol DealerValidationModuleViewPresenterInput: AnyObject {
    func showErrorAlert(message: String)
    func navigateToDealerLobbyModule(_ viewController: UIViewController)
}

// MARK: - DealerValidationModuleView
final class DealerValidationModuleView: UIViewController {
    // MARK: - Constants

    // MARK: - Properties
    var presenter: DealerValidationModulePresenterViewInput?
    
    private let enterPasswordLabel = UILabel()
    private let enterPasswordTextField = UITextField()
    private let confirmPasswordButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        addGestureRecognizer()
    }
}

// MARK: - UI setup
private extension DealerValidationModuleView {
    func setupUI() {
        setupBackgroundImage()
        setupEnterPasswordLabel()
        setupEnterPasswordTextField()
        setupConfirmPasswordButton()
    }
    
    func setupBackgroundImage() {
        if let backgroundImage = UIImage(named: "poker-table-background") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            view.backgroundColor = .green
        }
    }
    
    func setupEnterPasswordLabel() {
        enterPasswordLabel.font = .systemFont(ofSize: 40, weight: .bold)
        enterPasswordLabel.textColor = .white
        enterPasswordLabel.textAlignment = .center
        enterPasswordLabel.numberOfLines = 0
        enterPasswordLabel.text = "Enter password"
        view.addSubview(enterPasswordLabel)
    }
    
    func setupEnterPasswordTextField() {
        enterPasswordTextField.borderStyle = .roundedRect
        enterPasswordTextField.font = .systemFont(ofSize: 25)
        enterPasswordTextField.delegate = self
        enterPasswordTextField.addTarget(self, action: #selector(enterPasswordTextFieldDidChange), for: .editingChanged)
        view.addSubview(enterPasswordTextField)
    }
    
    func setupConfirmPasswordButton() {
        confirmPasswordButton.setTitle("Confirm", for: .normal)
        confirmPasswordButton.backgroundColor = .red
        confirmPasswordButton.setTitleColor(.white, for: .normal)
        confirmPasswordButton.titleLabel?.font = .systemFont(ofSize: 25)
        confirmPasswordButton.layer.cornerRadius = 10
        confirmPasswordButton.isEnabled = false
        confirmPasswordButton.addTarget(self, action: #selector(confirmPasswordButtonTapped), for: .touchUpInside)
        view.addSubview(confirmPasswordButton)
    }
}

// MARK: - Constraints
private extension DealerValidationModuleView {
    func setupConstraints() {
        setupEnterPasswordLabelConstraints()
        setupEnterPasswordTextFieldConstraints()
        setupConfirmPasswordButtonConstraints()
    }
    
    func setupEnterPasswordLabelConstraints() {
        enterPasswordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupEnterPasswordTextFieldConstraints() {
        enterPasswordTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(50)
        }
    }
    
    func setupConfirmPasswordButtonConstraints() {
        confirmPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(100)
        }
    }
}

// MARK: - Actions
private extension DealerValidationModuleView {
    @objc func enterPasswordTextFieldDidChange() {
        updateConfirmPasswordButtonState()
    }
    
    @objc func confirmPasswordButtonTapped() {
        let password = enterPasswordTextField.text ?? ""
        presenter?.didTapConfirmPasswordButton(password)
    }
    
    @objc func hideKeyboard() {
        enterPasswordTextField.resignFirstResponder()
    }
}

// MARK: - Register confirmPasswordButton state
private extension DealerValidationModuleView {
    func updateConfirmPasswordButtonState() {
        let isEnterPasswordTextFieldFilled = !(enterPasswordTextField.text ?? "").isEmpty
        confirmPasswordButton.isEnabled = isEnterPasswordTextFieldFilled
        confirmPasswordButton.backgroundColor = isEnterPasswordTextFieldFilled ? .green : .red
    }
}


// MARK: - UITextFieldDelegate
extension DealerValidationModuleView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Helpers
private extension DealerValidationModuleView {
    func addGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - DealerValidationModuleViewPresenterInput
extension DealerValidationModuleView: DealerValidationModuleViewPresenterInput {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToDealerLobbyModule(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
