//
//  ContentView.swift
//  DailyItalian
//
//  Created by JP Ungaretti on 10/6/25.
//

import SwiftUI
import DailyItalianLibrary

struct ContentView: View {
    @State var translation = italianEnglishProvider.random()
    
    var body: some View {
        VStack {
            Spacer()

            VStack() {
                Text(String(translation.to.language.flagEmoji))
                    .font(.title)
                Text(translation.to.value)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(translation.from.value)
                    .font(.system(.body))
            }

            Spacer()

            Button(action: {
                translation = italianEnglishProvider.random()
            }) {
                VStack(spacing: 5) {
                    Image(systemName: "shuffle")
                    Text("Shuffle")
                        .font(.headline)
                }
                .frame(maxWidth: 300)
                .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
