//
//  MyInfoResponseDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/6/26.
//

import Foundation

struct MyInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserDataDTO?
    let meat: ErrorResponseDTO?
}
