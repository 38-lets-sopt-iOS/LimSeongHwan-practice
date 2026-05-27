//
//  StoryListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct StoryListView: View {
    let userList: [StoryModel]
    @Binding var isActive: Set<UUID>
    let onClick: (UUID) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(userList) { userList in
                    StoryListPeople(userData: userList, isActive: isActive.contains(userList.id))
                        .onTapGesture {
                            onClick(userList.id)
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct StoryListPeople: View {
    let userData: StoryModel
    let isActive: Bool
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 65, height: 65)
            .foregroundStyle(isActive ? .blue : .gray)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(isActive ? .green : .gray)
                    .frame(width: 15, height: 15)
            }
    }
}
