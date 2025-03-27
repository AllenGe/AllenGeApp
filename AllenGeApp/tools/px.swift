//
//  PxToPt.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/27.
//

import Foundation
import UIKit


class px {
    /// 将像素值转换为点值
    /// - Parameter pixels: 像素值
    /// - Returns: 对应的点值
    static func topt(_ pixels: CGFloat) -> CGFloat {
        let scaleFactor = UIScreen.main.scale
        let ret = pixels / scaleFactor
        
        print("\(pixels)px 转换为 \(ret)pt")
        
        return ret
    }
}

//// 使用示例
//let pixels = 14.0
//let points = px.topt(pixels)
//print("\(pixels)px 转换为 \(points)pt")
