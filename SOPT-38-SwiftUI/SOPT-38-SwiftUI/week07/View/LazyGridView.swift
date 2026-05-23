//
//  LazyGridView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/23/26.
//

import SwiftUI

struct LazyGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<20) { i in
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.cyan))
                            .padding(10)
                        Text("아이템 \(i + 1)")
                            .padding(.bottom, 10)
                    }.frame(width: 150, height: 120)
                        .background(Color(.blue))
                        .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    LazyGridView()
}
