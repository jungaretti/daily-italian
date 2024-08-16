//
//  TranslationWidget.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import WidgetKit
import SwiftUI
import DailyLibrary

struct TranslationWidget: Widget {
    let kind: String = "DailyWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: TranslationWidgetConfigurationIntent.self,
            provider: TranslationIntentTimelineProvider()) { entry in
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
    TranslationTimelineEntry(date: Date.now, translation: italianEnglishHello)
}

#Preview(as: .systemMedium) {
    TranslationWidget()
} timeline: {
    TranslationTimelineEntry(date: Date.now, translation: italianEnglishHello)
}
