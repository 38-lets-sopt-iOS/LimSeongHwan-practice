//
//  LoginViewController.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/9/26.
//

import UIKit
import SnapKit

class LoginViewController_Snapkit: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subHead1
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/225, alpha: 1)
        textField.font = .subHead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/225, alpha: 1)
        textField.font = .subHead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let autoLoginLabel: UILabel = {
        let label = UILabel()
        label.text = "자동 로그인"
        label.font = .subHead4
        label.textColor = .gray
        return label
    }()
    
    let autoLoginSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = .orange
        toggle.thumbTintColor = .white
        return toggle
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = .subHead1
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .orange
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(autoLoginLabel)
        view.addSubview(autoLoginSwitch)
        view.addSubview(loginButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(169)
        }
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
    }
    @objc
    func loginButtonDidTap() {
        //presentToWelcomeVC()
        navigateToWelcomeVC()
    }
    
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }
    
    func navigateToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        //        welcomeViewController.id = loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
}
