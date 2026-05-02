//
//  SignupResponseDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/2/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}

struct ErrorResponseDTO: Decodable {
    let path: String
    let itmestamp: String
}
