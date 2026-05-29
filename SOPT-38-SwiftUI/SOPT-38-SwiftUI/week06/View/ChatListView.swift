//
//  ChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct ChatListView: View {
    let chatLists: [ChatListModel]
    
    var body: some View {
        List(chatLists) { chatLists in
            ChatView(chatList: chatLists)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}
//
//#Preview {
//
//    ChatListView(chatLists: chatLists)
//}
