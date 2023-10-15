//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/15/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now, translation: Translation(english: "hello", translated: "ciao"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: .now, translation: Translation(english: "hello", translated: "ciao"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: .now, translation: Translation(english: "hello", translated: "ciao"))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct Translation {
    let english: String
    let translated: String
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let translation: Translation
}

struct DailyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.translation.english)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(entry.translation.translated)
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
    SimpleEntry(date: .now, translation: Translation(english: "hello", translated: "ciao"))
}
