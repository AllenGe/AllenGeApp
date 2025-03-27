//
//  ContentView.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var landmark: Landmark
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height:300)
            
            CircleImage(imageName: landmark.imageName)
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading) {
                Text("TextName").font(.title).fontWeight(.bold).foregroundStyle(.red)
                HStack {
                    Text("Text vstact 2 2 2").font(.subheadline)
                    Spacer()
                    Text("Text vstact 333").font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding(12)

            Spacer()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView(landmark: landmarks[0])
        .modelContainer(for: Item.self, inMemory: true)
}
