//
//  StoryModel.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import Foundation

struct StoryModel: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
}

extension StoryModel {
    static let users: [StoryModel] = [
        StoryModel(name: "나연", message: "듀듀듀", time: "오전 9:41"),
        StoryModel(name: "소은", message: "영화 보러 가자요", time: "오전 9:41"),
        StoryModel(name: "승희", message: "버블티머글사람", time: "오전 9:41"),
        StoryModel(name: "교은", message: "내일 점심 어때요?", time: "오전 9:41"),
        StoryModel(name: "지인", message: "내 말 들리나요", time: "오전 9:41")
    ]
}
