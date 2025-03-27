//
//  LandmarkDetail.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
 
    var body: some View {

        
        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height:300)
            
            NavigationLink(destination: FontSizePreview())  {
                CircleImage(imageName: landmark.imageName)
                    .offset(y:-130)
                    .padding(.bottom,-130)
            }
            
            
            VStack(alignment: .leading) {
                Text(landmark.name).font(.title).fontWeight(.bold).foregroundStyle(.red)
                HStack {
                    Text(landmark.city).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text(landmark.park)
                    .font(.title2)
                Text(landmark.description).font(.subheadline)
            }
            .padding(12)

            Spacer()
        }

    }
}

//#Preview {
//    LandmarkDetail(landmark: landmarks[0])
//
//}
