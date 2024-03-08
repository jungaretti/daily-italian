//
//  Entry.swift
//  DailyLanguage
//
//  Created by JP Ungaretti on 3/7/24.
//

import WidgetKit
import SwiftUI
import CoreLanguage

struct SimpleEntry: TimelineEntry {
    let date: Date
    let translation: CoreLanguage.Translation
}
