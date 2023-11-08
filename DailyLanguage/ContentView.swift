//
//  ContentView.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 10/15/23.
//

import SwiftUI
import LanguageKit

struct ContentView: View {
    @State var translation = globalProvider.randomTranslation(from: .English, to: .Italian)!
    
    var body: some View {
        VStack {
            Spacer()

            Text(String(translation.to.language.flagEmoji))
                .font(.title)
            VStack() {
                Text(translation.to.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(translation.from.text)
                    .font(.system(.body))
            }

            Spacer()

            Button(action: {
                translation = globalProvider.randomTranslation(from: .English, to: .Italian)!
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
