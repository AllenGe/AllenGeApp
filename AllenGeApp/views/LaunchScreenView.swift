//
//  LaunchScreenView.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/26.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 100, height: 100)
               .foregroundColor(.blue)
            Text("My App")
               .font(.largeTitle)
               .fontWeight(.bold)
        }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color.white)
    }
}

#Preview {
    LaunchScreenView()
}    
