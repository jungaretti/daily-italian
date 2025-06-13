//
//  TranslationTimelineEntry.swift
//  DailyItalianWidget
//
//  Created by JP Ungaretti on 3/9/24.
//

import WidgetKit
import DailyItalianLibrary

struct TranslationTimelineEntry: TimelineEntry {
    let date: Date
    let translation: Translation
}
