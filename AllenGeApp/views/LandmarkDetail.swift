//
//  LandmarkDetail.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        

        @Bindable var modelData = modelData //@Bindable 属性包装器：在 LandmarkDetail 视图的 body 中，使用 @Bindable var modelData = modelData 来创建一个可绑定的 modelData 实例。这让你可以直接在视图中修改 modelData 的属性，并且 SwiftUI 会自动处理数据绑定和视图更新。

        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height:300)
            
            NavigationLink(destination: FontSizePreview())  {
                CircleImage(imageName: landmark.imageName)
                    .offset(y:-130)
                    .padding(.bottom,-130)
            }
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title).fontWeight(.bold).foregroundStyle(.red)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)

                }
                HStack {
                    Text(landmark.city).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider().padding(EdgeInsets.init(top: 4, leading:0, bottom: 4, trailing: 0))
                
                Text(landmark.park)
                    .font(.title2)
                Text(landmark.description).font(.subheadline)
            }
            .padding(12)

            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)


    }
}

#Preview {
    let modelData = ModelData()

    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)

}
