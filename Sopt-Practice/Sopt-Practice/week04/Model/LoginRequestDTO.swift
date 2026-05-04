//
//  LoginRequestDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/4/26.
//

import Foundation

struct LoginRequestDTO: Encodable {
    let loginId: String
    let password: String
}
