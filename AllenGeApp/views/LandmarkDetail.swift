//
//  LandmarkDetail.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData // 环境对象
    @Environment(\.dismiss) private var dismiss
    
    var landmark: Landmark
    var landmarkIndex: Int {
        /* 通过 ID 查找索引 */
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        
//        @Bindable：将 modelData 转为可绑定对象，使数组元素的属性修改能被 SwiftUI 感知。
        @Bindable var modelData = modelData //关键点：可转化为绑定对象

        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height:300)

                
                NavigationLink(destination: FontSizePreview())  {
                    CircleImage(imageName: landmark.imageName)
                }
                .offset(y:-130)
                .padding(.bottom,-130)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name).font(.title).fontWeight(.bold).foregroundStyle(.red)
                        
//                        modelData.landmarks[landmarkIndex].isFavorite：通过 $ 符号将 具体属性 转为 绑定类型
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
        }
        .navigationTitle(landmark.name)
        .customBackButton() // 使用自定义修饰符


    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
//    子视图在这里继续写.environment(modelData)是为了#Preview单页面预览，实际运行中，#Preview是不需要的
}

/*
 
 数据流完整链路
 step1、用户点击按钮 → 触发 isSet.toggle()

 step2、修改绑定值 → modelData.landmarks[landmarkIndex].isFavorite 被更新

 step3、@Observable 检测变化 → 通知 SwiftUI 更新依赖该数据的视图

 step4、视图刷新 → 按钮图标和颜色根据新值重新渲染
 
 
 双向绑定 (@Binding) SwiftUI 5.0 (iOS 17+) 的新特性
 允许子组件直接修改父视图的状态，实现跨组件通信。

 环境对象 (@Environment)
 跨视图层级共享数据模型，避免逐层传递。

 可观察对象 (@Observable)
 自动监听数据变化，无需手动调用 objectWillChange。

 值类型数组修改
 当 Landmark 是结构体时，直接修改数组元素的属性会触发更新，因为 SwiftUI 通过 @Bindable 包装器实现了对值类型属性的观察。


*/

