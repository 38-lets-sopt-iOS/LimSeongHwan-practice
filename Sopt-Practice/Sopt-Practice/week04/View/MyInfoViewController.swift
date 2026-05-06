//
//  MyInfoViewController.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/5/26.
//

import UIKit
import SnapKit
import Then

class MyInfoViewController: BaseUIViewController {
    // MARK: - property

    private var name: String?
    private var email: String?
    private var age: Int?

    // MARK: - UI

    private let idTextField = AuthTextField(enabled: false)
    private let nameTextField = AuthTextField()
    private let emailTextField = AuthTextField()
    private let ageTextField = AuthTextField()
    private let partTextField = AuthTextField(enabled: false)
    
    private let modifyButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
    }

    // MARK: - setup

    override func setUp() {
        view.addSubviews(idTextField, nameTextField, emailTextField, ageTextField, partTextField, modifyButton)
        getMyInfo()
    }
    
    // MARK: - layout
    
    override func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(70)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        modifyButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }

}

// MARK: - extension

extension MyInfoViewController {
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        default:
            return
        }
    }
    
    private func getMyInfo() {
        Task {
            do {
                let response = try await MyInfoService.shared.getMyInfo()
                UserManager.shared.loginId = response.loginId
                UserManager.shared.name = response.name
                UserManager.shared.email = response.email
                UserManager.shared.age = response.age
                UserManager.shared.part = response.part
                self.updateUI()
            } catch {
                let alert = UIAlertController(title: "개인정보 조회 실패", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    private func updateUI() {
        idTextField.text = UserManager.shared.loginId
        nameTextField.text = UserManager.shared.name
        emailTextField.text = UserManager.shared.email
        ageTextField.text = UserManager.shared.age.map { "\($0)" }
        partTextField.text = UserManager.shared.part
    }
    
    @objc
    private func modifyButtonDidTap() {
        
    }
}
