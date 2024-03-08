//
//  TranslationEntry.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/7/24.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct TranslationEntry: TimelineEntry {
    let date: Date
    let translation: Translation
}
