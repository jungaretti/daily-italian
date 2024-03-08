//
//  Provider.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 3/7/24.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        getRandomEntryFor(date: .now)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry: SimpleEntry
        if context.isPreview {
            entry = SimpleEntry(date: .now, translation: Translation(from: Language.English.hello, to: Language.Italian.hello))
        } else {
            entry = getRandomEntryFor(date: .now)
        }

        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline entry for each of the next 24 hours
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)
            entries.append(getRandomEntryFor(date: entryDate!))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    private func getRandomEntryFor(date: Date) -> SimpleEntry {
        let entryTranslation = globalProvider.randomTranslation(from: .English, to: .Italian)
        return SimpleEntry(date: date, translation: entryTranslation)
    }
}
