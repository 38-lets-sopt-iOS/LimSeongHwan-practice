//
//  UserError.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/6/26.
//

enum UserError: Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case userIdNotFound

    var errorDescription: String {
        switch self {
        case .userIdNotFound: return "사용자 ID를 찾을 수 없습니다."
        }
    }
}
