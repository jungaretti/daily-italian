//
//  TranslationIntentTimelineProvider.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import Foundation
import WidgetKit
import DailyLibrary

struct TranslationIntentTimelineProvider: AppIntentTimelineProvider {
    typealias Entry = TranslationTimelineEntry
    typealias Intent = TranslationWidgetConfigurationIntent

    func placeholder(in context: Context) -> TranslationTimelineEntry {
        getRandomEntryFor(date: .now)
    }
    
    func snapshot(for configuration: TranslationWidgetConfigurationIntent, in context: Context) async -> TranslationTimelineEntry {
        let entry: TranslationTimelineEntry
        if context.isPreview {
            entry = TranslationTimelineEntry(date: .now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
        } else {
            entry = getRandomEntryFor(date: .now)
        }

        return entry
    }
    
    func timeline(for configuration: TranslationWidgetConfigurationIntent, in context: Context) async -> Timeline<TranslationTimelineEntry> {
        var entries: [TranslationTimelineEntry] = []

        // Generate a timeline entry for each of the next 24 hours
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)
            entries.append(getRandomEntryFor(date: entryDate!))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
    
    private func getRandomEntryFor(date: Date) -> TranslationTimelineEntry {
        let entryTranslation = globalProvider.randomTranslation(from: .English, to: .Italian)
        return TranslationTimelineEntry(date: date, translation: entryTranslation)
    }
}
