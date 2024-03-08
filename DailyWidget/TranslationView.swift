//
//  DailyWidgetEntryView.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/7/24.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct TranslationView : View {
    var translation: Translation

    var body: some View {
        VStack {
            HStack {
                Text(translation.to.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                Spacer()
            }
            HStack {
                Text(translation.from.text)
                    .font(.system(.body))
                Spacer()
            }

            Spacer()

            HStack {
                Text(String(translation.to.language.flagEmoji))
                    .font(.title)
                Spacer()
            }
        }
    }
}
