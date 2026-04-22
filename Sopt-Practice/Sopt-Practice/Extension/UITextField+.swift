//
//  UITextField+.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/22/26.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
