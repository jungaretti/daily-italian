//
//  TranslationView.swift
//  DailyItalianWidget
//
//  Created by JP Ungaretti on 3/9/24.
//

import SwiftUI
import DailyItalianLibrary

struct TranslationView : View {
    @Environment(\.widgetRenderingMode) var renderingMode

    var entry: TranslationIntentTimelineProvider.Entry

    var body: some View {
        VStack {
            HStack {
                Text(entry.translation.to.value)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .widgetAccentable()
                Spacer()
            }
            HStack {
                Text(entry.translation.from.value)
                    .font(.system(.body))
                Spacer()
            }

            Spacer()

            HStack {
                switch renderingMode {
                case .fullColor:
                    Text(String(entry.translation.to.language.flagEmoji))
                        .font(.title)
                default:
                    EmptyView()
                }
                Spacer()
            }
        }
    }
}
