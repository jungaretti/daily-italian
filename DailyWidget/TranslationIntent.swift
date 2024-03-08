//
//  TranslationIntent.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/7/24.
//

import AppIntents
import WidgetKit

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
