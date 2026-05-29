//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 성환 on 5/16/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(.profile1)
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text("이름임").font(.headline)
                    Text("지역임")
                        .font(.subheadline)
                        .foregroundStyle(.gray500)
                }
                Text("메세지임")
            }
            Spacer()
            Image(.item3)
                .resizable()
                .frame(width: 40, height: 40)
        }.padding([.leading, .trailing], 60)
    }
}

#Preview {
    ContentView()
}
