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
            entry = TranslationTimelineEntry(date: .now, translation: italianEnglishHello)
        } else {
            entry = getRandomEntryFor(date: .now)
        }

        return entry
    }
    
    func timeline(for configuration: TranslationWidgetConfigurationIntent, in context: Context) async -> Timeline<TranslationTimelineEntry> {
        let currentDate = Date()
        let timelineDates = (0 ..< 40).map { timelineIndex in
            let indexToTimeInterval: Double = configuration.interval.timeInterval * Double(timelineIndex)
            return currentDate.addingTimeInterval(indexToTimeInterval)
        }

        let entries = timelineDates.map { entryDate in
            getRandomEntryFor(date: entryDate)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
    
    private func getRandomEntryFor(date: Date) -> TranslationTimelineEntry {
        let entryTranslation = italianEnglishDictionary.randomElement()!
        return TranslationTimelineEntry(date: date, translation: entryTranslation)
    }
}
