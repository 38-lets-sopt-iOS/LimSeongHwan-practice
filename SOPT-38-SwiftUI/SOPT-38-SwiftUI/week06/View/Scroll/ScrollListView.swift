//
//  ScrollListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct ScrollListView: View {
    var body: some View {
        HorizontalScrollView()
    }
}

struct VerticalScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("Item\($0)")
                        .font(.title)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<100) {
                    Text("Item\($0)")
                        .font(.title)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ScrollListView()
}
