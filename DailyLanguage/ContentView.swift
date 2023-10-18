//
//  ContentView.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 10/15/23.
//

import SwiftUI
import DailyLibrary

struct ContentView: View {
    @State var translation = globalProvider.randomTranslation(to: .Italian)!
    
    var body: some View {
        VStack {
            Text(translation.language.emoji)
                .font(.title)
            VStack() {
                Text(translation.translation)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(translation.original)
                    .font(.system(.body))
            }
            .padding()
            Button(action: {
                translation = globalProvider.randomTranslation(to: .Italian)!
            }) {
                Text("Shuffle")
            }
        }
    }
}

#Preview {
    ContentView()
}
