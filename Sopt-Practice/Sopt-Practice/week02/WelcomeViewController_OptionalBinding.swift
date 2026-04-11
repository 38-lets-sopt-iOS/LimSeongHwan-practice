//
//  WelcomeViewController.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/9/26.
//

import UIKit

class WelcomeViewController_OptionalBinding: UIViewController {
    private var id: String? = nil
    
    let welcomeImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "welcome")
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 65))
        label.text = "???님\n 반가워요!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .head1

        return label
    }()
    
    let toMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .subHead1
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        
        return button
    }()
    
    lazy var tologinButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.setTitle("다시 로그인", for: .normal)
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.titleLabel?.textColor = UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1)
        button.titleLabel?.font = .subHead1
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
//        bindId()
    }
    
    func setView() {
        view.addSubview(welcomeImage)
        view.addSubview(welcomeText)
        view.addSubview(toMainButton)
        view.addSubview(tologinButton)
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
//    func bindId() {
//        welcomeText.text = "\(id ?? "")님\n반가워요!"
//    }
    
    func configure(id: String?) {
        self.id = id
        if let realId = id {
            welcomeText.text = "\(realId)님\n반가워요!"
        } else {
            welcomeText.text = "안녕하세요!"
        }
    }
}
