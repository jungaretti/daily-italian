//
//  Provider.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 3/7/24.
//

import AppIntents
import WidgetKit
import SwiftUI
import CoreLanguage

enum RefreshInterval: String, AppEnum {
    case hourly, daily

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Refresh Interval"
    static var caseDisplayRepresentations: [RefreshInterval : DisplayRepresentation] = [
        .hourly: "Every Hour",
        .daily: "Every Day",
    ]
}

struct TranslationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Translation"
    static var description = IntentDescription("Shows a translation")

    @Parameter(title: "Refresh", default: .hourly)
    var interval: RefreshInterval
}

struct TranslationProvider: AppIntentTimelineProvider {
    typealias Entry = TranslationEntry
    typealias Intent = TranslationIntent
    
    func placeholder(in context: Context) -> TranslationEntry {
        getRandomEntryFor(date: .now)
    }
    
    func snapshot(for configuration: TranslationIntent, in context: Context) async -> TranslationEntry {
        let entry: Entry
        if context.isPreview {
            entry = Entry(date: .now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
        } else {
            entry = getRandomEntryFor(date: .now)
        }
        
        return entry
    }
    
    func timeline(for configuration: TranslationIntent, in context: Context) async -> Timeline<TranslationEntry> {
        var entries: [Entry] = []

        // Generate a timeline entry for each of the next 24 hours
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)
            entries.append(getRandomEntryFor(date: entryDate!))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }

    private func getRandomEntryFor(date: Date) -> TranslationEntry {
        let entryTranslation = globalProvider.randomTranslation(from: .English, to: .Italian)
        return Entry(date: date, translation: entryTranslation)
    }
}
