//
//  CircleImage.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Circle(), style: FillStyle())
            .overlay {
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius: 12)
    }
}

#Preview {
    CircleImage(imageName: "stmarylake")
}
