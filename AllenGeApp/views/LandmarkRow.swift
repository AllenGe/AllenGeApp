//
//  LandmarkRow.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI
 

struct LandmarkRow: View {
    var landmark: Landmark

    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 56,height: 56)
                .clipShape(Circle(), style: FillStyle())
                .overlay {
                    Circle().stroke(.white,lineWidth: 2)
                }
                .shadow(radius: 6)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

//#Preview("stmarylake index0") {
//    LandmarkRow(landmark: landmarks[0])
//}
//#Preview("silversalmoncreek index1") {
//    LandmarkRow(landmark: landmarks[1])
//}

#Preview() {
    if /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/ {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
    } else {
        EmptyView()
    }
}

