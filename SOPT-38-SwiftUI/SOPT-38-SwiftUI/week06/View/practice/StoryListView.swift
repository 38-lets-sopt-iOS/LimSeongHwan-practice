//
//  StoryListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct StoryListView: View {
    let userList: [StoryModel]
    
    var body: some View {
        List(userList) { userList in
            StoryListPeople(userData: userList)
        }
        .listStyle(.plain)
    }
}

struct StoryListPeople: View {
    let userData: StoryModel
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    StoryListView(userList: StoryModel.users)
}
