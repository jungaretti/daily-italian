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
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now, language: italianProvider.language, translation: Translation(original: "hello", translation: "ciao"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: .now, language: italianProvider.language, translation: italianProvider.getRandomTranslation())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: .now, language: italianProvider.language, translation: italianProvider.getRandomTranslation())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
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
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    DailyWidget()
} timeline: {
    SimpleEntry(date: .now, language: italianProvider.language, translation: Translation(original: "hello", translation: "ciao"))
}
