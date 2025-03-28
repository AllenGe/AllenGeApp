//
//  FontSizePreview.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/27.
//

import SwiftUI

struct FontSizePreview: View {
    var body: some View {
        Divider()
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("34pt Large Title")
                    .font(.largeTitle)
                Text("28pt Title")
                    .font(.title)
                Text("22pt Title 2")
                    .font(.title2)
                Text("20pt Title 3")
                    .font(.title3)
                Text("17pt (粗体) Headline")
                    .font(.headline)
                Text("15ptSubheadline")
                    .font(.subheadline)
                Text("17pt Body")
                    .font(.body)
                Text("16pt Callout")
                    .font(.callout)
                Text("13pt Footnote")
                    .font(.footnote)
                Text("12pt Caption")
                    .font(.caption)
                Text("11pt Caption2")
                    .font(.caption2)
                // 在 SwiftUI 中打印实际字体大小
                Text("SwiftUI 字体样式    默认字号 (pt)    对应 UIKit 的 UIFont.TextStyle \n.largeTitle    34pt    .largeTitle \n.title    28pt    .title1 \n.title2    22pt    .title2  \n.title3    20pt    .title3 \n.headline    17pt (粗体)    .headline \n.subheadline    15pt    .subheadline  \n.body    17pt    .body \n.callout    16pt    .callout \n.footnote    13pt    .footnote \n.caption    12pt    .caption1 \n.caption2    11pt    .caption2")
                    .font(.callout)
                    .foregroundStyle(.blue)
                    .onAppear {
                        let font = UIFont.preferredFont(forTextStyle: .largeTitle)
                        print("Large Title 的 pt 值:", font.pointSize) // 输出 34.0
                    }
            }
        }
        .navigationTitle("FontSizePreview")
        .customBackButton() // 使用自定义修饰符
        
//        Spacer()
    }
}

#Preview {
    FontSizePreview()
}
