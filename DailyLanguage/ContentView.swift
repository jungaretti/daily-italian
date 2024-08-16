//
//  ContentView.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 10/15/23.
//

import SwiftUI
import DailyLibrary

struct ContentView: View {
    @State var translation = italianEnglishDictionary.randomElement()!
    
    var body: some View {
        VStack {
            Spacer()

            Text(String(translation.to.language.flagEmoji))
                .font(.title)
            VStack() {
                Text(translation.to.value)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(translation.from.value)
                    .font(.system(.body))
            }

            Spacer()

            Button(action: {
                translation = italianEnglishDictionary.randomElement()!
            }) {
                Text("Shuffle")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
