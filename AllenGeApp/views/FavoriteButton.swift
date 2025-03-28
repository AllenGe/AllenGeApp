//
//  FavoriteButton.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/27.
//

import SwiftUI


struct FavoriteButton: View {
//step1    @Binding：表示这个值来自父视图，且子视图可以修改它，实现双向数据流。
    @Binding var isSet: Bool


    var body: some View {
        Button {
//step2            点击触发 isSet.toggle()：直接修改绑定的布尔值。
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}


#Preview {
    FavoriteButton(isSet: .constant(true))
}

