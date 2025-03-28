//
//  LandmarkList.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LandmarkList: View {
//    ModelData.self：指定要获取的环境对象类型
    @Environment(ModelData.self) var modelData //@Environment 属性包装器：在 LandmarkDetail 视图中，使用 @Environment(ModelData.self) 来获取 ModelData 实例。这意味着 LandmarkDetail 视图能够访问和修改这个全局的 ModelData 实例。


    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        .padding(0)
            
        NavigationStack {
            VStack {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only 22")
                }.padding(EdgeInsets.init(top: 12, leading: 24, bottom: 6, trailing: 24))
            }
            List(filteredLandmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .listStyle(.plain) // 使用普通列表样式
            .navigationTitle("Allen.ge")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 0)
        }

    }
}

#Preview {
    
//    主视图把ModelData()对象 注入到整个导航栈环境 所有子视图都可以通过 @Environment(ModelData.self) 获取该实例
    LandmarkList().environment(ModelData())
    
}
