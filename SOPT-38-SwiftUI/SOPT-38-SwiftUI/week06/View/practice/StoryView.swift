//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/27/26.
//

import SwiftUI

struct StoryView: View {
    private let userData = StoryModel.users
    @State private var isActive: Set<UUID> = []
    
    private func toggleActive(id: UUID) {
        if isActive.contains(id) {
            isActive.remove(id)
        } else {
            isActive.insert(id)
        }
    }
    
    var body: some View {
        VStack {
            StoryListView(userList: userData, isActive: $isActive, onClick: toggleActive).padding([.bottom], 20)
            StoryChatListView(userList: userData, isActive: $isActive, onClick: toggleActive)
        }
    }
}

#Preview {
    StoryView()
}
