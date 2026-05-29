//
//  NavigationStackView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/23/26.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(Ganadi.friends) { friends in
                NavigationLink(friends.name, value: friends)
            }
            .navigationDestination(for: Ganadi.self) { friends in
                DetailView(friends: friends)
            }
            .navigationTitle("듀..")
        }
    }
}

struct DetailView: View {
    let friends: Ganadi
    
    var body: some View {
        Text(friends.detail)
            .navigationTitle(friends.name)
        Text(friends.emoji)
    }
}

#Preview {
    NavigationStackView()
}
