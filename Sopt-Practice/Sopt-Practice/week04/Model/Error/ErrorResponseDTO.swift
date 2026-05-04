//
//  ErrorResponseDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/4/26.
//

import Foundation

struct ErrorResponseDTO: Decodable {
    let path: String
    let itmestamp: String
}
