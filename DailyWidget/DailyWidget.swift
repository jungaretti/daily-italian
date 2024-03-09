//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI
import DailyLibrary

struct TranslationView : View {
    var entry: TranslationTimelineProvider.Entry

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

struct TranslationWidget: Widget {
    let kind: String = "DailyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TranslationTimelineProvider()) { entry in
            TranslationView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Random Word")
        .description("Learn new words every day.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    TranslationWidget()
} timeline: {
    TranslationTimelineEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}

#Preview(as: .systemMedium) {
    TranslationWidget()
} timeline: {
    TranslationTimelineEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}
