//
//  UserManager.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/5/26.
//

import Foundation

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var userId: Int?
    var loginId: String?
    var name: String?
    var email: String?
    var age: Int?
    var part: String?
}
