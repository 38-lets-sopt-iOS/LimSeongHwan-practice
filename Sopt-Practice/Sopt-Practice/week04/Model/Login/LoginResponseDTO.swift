//
//  LoginResponseDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/4/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: LoginUserData?
    let meta: ErrorResponseDTO?
}

struct LoginUserData: Decodable {
    let userId: Int
}
