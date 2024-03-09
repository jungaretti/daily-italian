//
//  TranslationView.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import SwiftUI
import DailyLibrary

struct TranslationView : View {
    var entry: TranslationIntentTimelineProvider.Entry

    var body: some View {
        VStack {
            HStack {
                Text(entry.translation.to.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                Spacer()
            }
            HStack {
                Text(entry.translation.from.text)
                    .font(.system(.body))
                Spacer()
            }

            Spacer()

            HStack {
                Text(String(entry.translation.to.language.flagEmoji))
                    .font(.title)
                Spacer()
            }
        }
    }
}
