//
//  AuthTextField.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/5/26.
//

import UIKit
import SnapKit
import Then

final class AuthTextField: UITextField {
    
    init(enabled: Bool = true) {
        super.init(frame: .zero)
        borderStyle = .roundedRect
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
        
        if !enabled {
            isEnabled = false
            backgroundColor = .lightGray
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
