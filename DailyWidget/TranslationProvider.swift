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

        let currentDate = Date()
        for intervalMultiple in 0 ..< 200 {
            let entryDate = currentDate.addingTimeInterval(configuration.interval.timeInterval * Double(intervalMultiple))
            let entry = getRandomEntryFor(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }

    private func getRandomEntryFor(date: Date) -> TranslationEntry {
        let entryTranslation = globalProvider.randomTranslation(from: .English, to: .Italian)
        return Entry(date: date, translation: entryTranslation)
    }
}
