//
//  LoginAPIViewController.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/2/26.
//

import UIKit
import SnapKit
import Then

class LoginAPIViewController: BaseUIViewController {
    // MARK: - 프로퍼티
    
    private var id: String = ""
    private var password: String = ""
    
    // MARK: - UI
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - setUp
    
    override func setUp() {
        view.addSubviews(idTextField, passwordTextField, loginButton)
    }
    
    // MARK: - Layout
    
    override func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Action
    
    override func setAction() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - API extension

extension LoginAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        Task {
            do {
                let _ = try await LoginService.shared.postLogin(loginId: id, password: password)
            } catch {
                let alert = UIAlertController(title: "로그인 실패", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
}
