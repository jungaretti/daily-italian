//
//  TranslationTimelineEntry.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import WidgetKit
import DailyLibrary

struct TranslationTimelineEntry: TimelineEntry {
    let date: Date
    let translation: Translation
}
