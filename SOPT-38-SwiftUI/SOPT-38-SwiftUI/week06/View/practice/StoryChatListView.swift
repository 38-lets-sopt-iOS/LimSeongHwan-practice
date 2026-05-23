//
//  StoryChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct StoryChatListView: View {
    let userList: [StoryModel]
    
    var body: some View {
        List(userList) { userList in
            StoryChatView(userData: userList)
        }
        .listStyle(.plain)
    }
}

struct StoryChatView: View {
    let userData: StoryModel
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 20)
            VStack(alignment: .leading) {
                Text(userData.name)
                Text(userData.message)
            }
            Spacer()
            Text(userData.time)
        }.padding(10)
    }
}

#Preview {
    StoryChatListView(userList: StoryModel.users)
}
