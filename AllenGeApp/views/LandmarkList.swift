//
//  LandmarkList.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        .padding(0)

        NavigationSplitView {
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Allen.ge")
        }detail: {
            Text("Text 123")
        }
    }
}

#Preview {
    LandmarkList()
}
