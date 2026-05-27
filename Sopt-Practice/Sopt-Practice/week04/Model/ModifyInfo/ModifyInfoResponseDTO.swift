//
//  ModifyInfoResponseDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/5/26.
//

import Foundation

struct ModifyInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserDataDTO?
    let meta: ErrorResponseDTO?
}
