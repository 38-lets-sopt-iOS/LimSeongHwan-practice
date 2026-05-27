//
//  ModyfyInfoRequestDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/5/26.
//

import Foundation

struct ModifyInfoRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
