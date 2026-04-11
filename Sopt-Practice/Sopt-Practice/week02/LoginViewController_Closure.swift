//
//  LoginViewController.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/9/26.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 169, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subHead1
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
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
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width:335, height: 52))
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
        let label = UILabel(frame: CGRect(x: 20, y: 408, width: 100, height: 31))
        label.text = "자동 로그인"
        label.font = .subHead4
        label.textColor = .gray
        return label
    }()

    let autoLoginSwitch: UISwitch = {
        let toggle = UISwitch(frame: CGRect(x: 284, y: 405, width: 51, height: 31))
        toggle.isOn = false
        toggle.onTintColor = .orange
        toggle.thumbTintColor = .white
        return toggle
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 515, width: 335, height: 57))
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
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(autoLoginLabel)
        view.addSubview(autoLoginSwitch)
        view.addSubview(loginButton)
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
        let welcomeViewController = WelcomeViewController_Closure()
//        welcomeViewController.id = loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        welcomeViewController.backToLoginCompletion = { [weak self] data in
            guard let self else { return }
            print("클로저로 받아온 데이터 : \(data)")
            self.titleLabel.text = "\(data)님, 다시 로그인하세요"
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }}
