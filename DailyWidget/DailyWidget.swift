//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct DailyWidget: Widget {
    let kind: String = "DailyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DailyWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Random Word")
        .description("Learn new words every day.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    DailyWidget()
} timeline: {
    SimpleEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}

#Preview(as: .systemMedium) {
    DailyWidget()
} timeline: {
    SimpleEntry(date: Date.now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
}
