//
//  NavigationStackView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/23/26.
//

import SwiftUI

struct NavigationStackView2: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            List(Ganadi.friends) { friends in
                NavigationLink(friends.name, value: friends)
            }
            .navigationDestination(for: Ganadi.self) { friends in
                DetailView(friends: friends)
            }
            Button("리스트 이동하기 state 버전") {
                isPresented = true
            }
            .navigationDestination(isPresented: $isPresented) {
                GanadiImageView()
            }
            .navigationTitle("듀..")
        }
    }
}

struct GanadiImageView: View {
  var body: some View {
      Image(.ganadi)
          .resizable()
          .scaledToFit()
  }
}

#Preview {
    NavigationStackView()
}
