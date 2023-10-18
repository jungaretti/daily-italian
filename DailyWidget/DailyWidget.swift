//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI
import DailyLibrary

struct Provider: TimelineProvider {
    private let translationProvider = italianProvider

    func placeholder(in context: Context) -> SimpleEntry {
        getRandomEntryFor(date: .now)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = getRandomEntryFor(date: .now)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline entry for each of the next 24 hours
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            entries.append(getRandomEntryFor(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    private func getRandomEntryFor(date: Date) -> SimpleEntry {
        let entryLanguage = translationProvider.language
        let entryTranslation = translationProvider.getRandomTranslation()
        
        return SimpleEntry(date: date, language: entryLanguage, translation: entryTranslation)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let language: Language
    let translation: Translation
}

struct DailyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Text(entry.translation.translation)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                Spacer()
            }
            HStack {
                Text(entry.translation.original)
                    .font(.system(.body))
                Spacer()
            }
            Spacer()
            HStack {
                Text(entry.language.emoji)
                    .font(.title)
                Spacer()
            }
        }
    }
}

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
    SimpleEntry(date: .now, language: .Italian, translation: Translation(original: "hello", translation: "ciao"))
}
