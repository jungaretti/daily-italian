//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/6/25.
//

import WidgetKit
import SwiftUI
import DailyItalianLibrary

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> TranslationEntry {
        TranslationEntry(date: Date(), translation: italianEnglishProvider.hello, configuration: TranslationConfigurationAppIntent())
    }
    
    func snapshot(for configuration: TranslationConfigurationAppIntent, in context: Context) async -> TranslationEntry {
        let entry: TranslationEntry
        if context.isPreview {
            entry = TranslationEntry(date: .now, translation: italianEnglishProvider.hello, configuration: configuration)
        } else {
            let randomTranslation = italianEnglishProvider.random()
            entry = TranslationEntry(date: .now, translation: randomTranslation, configuration: configuration)
        }

        return entry
    }
    
    func timeline(for configuration: TranslationConfigurationAppIntent, in context: Context) async -> Timeline<TranslationEntry> {
        let currentDate = Date()
        let timelineDates = (0 ..< 40).map { timelineIndex in
            let indexToTimeInterval: Double = configuration.interval.timeInterval * Double(timelineIndex)
            return currentDate.addingTimeInterval(indexToTimeInterval)
        }

        let entries = timelineDates.map { entryDate in
            let randomTranslation = italianEnglishProvider.random()
            return TranslationEntry(date: entryDate, translation: randomTranslation, configuration: configuration)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct TranslationEntry: TimelineEntry {
    let date: Date
    let translation: DailyItalianLibrary.Translation
    let configuration: TranslationConfigurationAppIntent
}

struct TranslationEntryView : View {
    @Environment(\.widgetRenderingMode) var renderingMode

    var entry: Provider.Entry

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

struct TranslationWidget: Widget {
    let kind: String = "DailyWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: TranslationConfigurationAppIntent.self,
            provider: Provider()) { entry in
                TranslationEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            }
        .configurationDisplayName("Random Word")
        .description("Learn new words every day.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

extension TranslationConfigurationAppIntent {
    fileprivate static var ciao: TranslationConfigurationAppIntent {
        let intent = TranslationConfigurationAppIntent()
        intent.interval = .fiveMinutes
        return intent
    }
}

#Preview(as: .systemSmall) {
    TranslationWidget()
} timeline: {
    TranslationEntry(date: Date.now, translation: italianEnglishProvider.hello, configuration: .ciao)
}

#Preview(as: .systemMedium) {
    TranslationWidget()
} timeline: {
    TranslationEntry(date: Date.now, translation: italianEnglishProvider.hello, configuration: .ciao)
}
