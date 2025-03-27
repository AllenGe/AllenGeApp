//
//  ContentView.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/20.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Large Title")
               .font(.largeTitle)
            Text("Title")
               .font(.title)
            Text("Title 2")
               .font(.title2)
            Text("Title 3")
               .font(.title3)
            Text("Headline")
               .font(.headline)
            Text("Subheadline")
               .font(.subheadline)
            Text("Body")
               .font(.body)
            Text("Callout")
               .font(.callout)
            Text("Footnote")
               .font(.footnote)
            Text("Caption")
               .font(.caption)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
