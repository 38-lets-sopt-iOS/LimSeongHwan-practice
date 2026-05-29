//
//  StoryChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct StoryChatListView: View {
    let userList: [StoryModel]
    @Binding var isActive: Set<UUID>
    let onClick: (UUID) -> Void

    var body: some View {
        List(userList) { userList in
            StoryChatView(
                userData: userList,
                isActive: isActive.contains(
                    userList.id
                ),
                onClick: {
                    onClick(userList.id)
                }
            )
        }
        .listStyle(.plain)
    }
}

struct StoryChatView: View {
    let userData: StoryModel
    let isActive: Bool
    let onClick: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)
                .foregroundStyle(isActive ? .blue : .gray)
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .fill(isActive ? .green : .gray)
                        .frame(width: 15, height: 15)
                        .offset(x: -6, y: 0)
                }
            VStack(alignment: .leading) {
                Text(userData.name)
                    .font(.title3)
                Text(userData.message)
            }
            Spacer()
            Text(userData.time)
        }
        .padding(10)
        .onTapGesture {
            onClick()
        }
    }
}
