//
//  ModelData.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import Foundation

//@Observable 类：ModelData 类使用了 @Observable 标记，这是 SwiftUI 里用于声明可观察对象的特性。当 ModelData 类的属性（像 landmarks）发生变化时，SwiftUI 会自动检测到这些变化，并且更新依赖于这些属性的视图。

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
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




