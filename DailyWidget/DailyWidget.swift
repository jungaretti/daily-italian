//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI
import DailyLibrary

struct TranslationTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> TranslationTimelineEntry {
        getRandomEntryFor(date: .now)
    }

    func getSnapshot(in context: Context, completion: @escaping (TranslationTimelineEntry) -> ()) {
        let entry: TranslationTimelineEntry
        if context.isPreview {
            entry = TranslationTimelineEntry(date: .now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
        } else {
            entry = getRandomEntryFor(date: .now)
        }

        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [TranslationTimelineEntry] = []

        // Generate a timeline entry for each of the next 24 hours
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)
            entries.append(getRandomEntryFor(date: entryDate!))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    private func getRandomEntryFor(date: Date) -> TranslationTimelineEntry {
        let entryTranslation = globalProvider.randomTranslation(from: .English, to: .Italian)
        return TranslationTimelineEntry(date: date, translation: entryTranslation)
    }
}

struct TranslationTimelineEntry: TimelineEntry {
    let date: Date
    let translation: DailyLibrary.Translation
}

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
