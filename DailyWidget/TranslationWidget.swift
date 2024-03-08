//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct TranslationWidget: Widget {
    let kind: String = "DailyWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: TranslationIntent.self,
            provider: TranslationProvider()) { entry in
                TranslationView(translation: entry.translation)
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
    TranslationEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}

#Preview(as: .systemMedium) {
    TranslationWidget()
} timeline: {
    TranslationEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}
