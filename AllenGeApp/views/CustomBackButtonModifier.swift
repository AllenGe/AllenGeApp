//
//  CustomBackButtonModifier.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/28.
//

import SwiftUI

struct BtnBackModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
           .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
           .navigationBarBackButtonHidden(true)
           .navigationBarTitleDisplayMode(.inline)
    }

}

// 为 View 扩展一个使用自定义修饰符的方法
extension View {
    func customBackButton() -> some View {
        modifier(BtnBackModifier())
    }
}

