//
//  ChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    let chatList: ChatListModel

    var body: some View {
        HStack {
            Image(chatList.profileImage)
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(chatList.name).font(.headline)
                    Text(chatList.location)
                        .font(.subheadline)
                        .foregroundStyle(.gray500)
                }
                Text(chatList.lastMessage)
                    .font(.caption)
            }
            Spacer()
            Image(chatList.productImage)
                .resizable()
                .frame(width: 40, height: 40)
        }.padding([.leading, .trailing], 30)
    }
}
