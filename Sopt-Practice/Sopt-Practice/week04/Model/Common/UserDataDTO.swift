//
//  UserDataDTO.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/6/26.
//

import Foundation

struct UserDataDTO: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
