//
//  Landmark.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var park: String
    var state: String
    var description: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }

    var isFavorite: Bool

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}


