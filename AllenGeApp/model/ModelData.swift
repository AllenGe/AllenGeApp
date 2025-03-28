//
//  ModelData.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import Foundation

//@Observable 类：ModelData 类使用了 @Observable 标记，这是 SwiftUI 里用于声明可观察对象的特性。当 ModelData 类的属性（像 landmarks）发生变化时，SwiftUI 会自动检测到这些变化，并且更新依赖于这些属性的视图。

//作用：使类的属性变化可被 SwiftUI 检测
//原理：基于 Swift 5.5+ 的 @Observable 宏，自动生成变更通知代码
@Observable
class ModelData {
    static let shared = ModelData()

//    var landmarks: [Landmark] = load("landmarkData.json")
    
    var landmarks: [Landmark] = [] {
        didSet {
            save() // 每次 landmarks 修改时自动保存到本地
        }
    }
 
    // 初始化时优先加载保存的数据
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "savedLandmarks") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Landmark].self, from: savedData) {
                landmarks = decoded
                return
            }
        }
        // 如果 UserDefaults 无数据，则从 JSON 加载
        landmarks = load("landmarkData.json")
    }

//     保存完整数据到 UserDefaults
    private func save() {
        print("111 保存前的 isFavorite 状态: \(landmarks.map { $0.isFavorite })")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(landmarks) {
            UserDefaults.standard.set(encoded, forKey: "savedLandmarks")
        }
    }

}

//var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}




