//
//  TranslationIntent.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/7/24.
//

import AppIntents
import WidgetKit

enum RefreshInterval: TimeInterval, AppEnum {
    case minutely, hourly, daily

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Refresh Interval"
    static var caseDisplayRepresentations: [RefreshInterval : DisplayRepresentation] = [
        .minutely: "Every Minute",
        .hourly: "Every Hour",
        .daily: "Every Day",
    ]
    
    var timeInterval: TimeInterval {
        switch self {
        case .minutely:
            return TimeInterval(60)
        case .hourly:
            return TimeInterval(3600)
        case .daily:
            return TimeInterval(86_400)
        }
    }
}

struct TranslationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Translation"
    static var description = IntentDescription("Shows a translation")

    @Parameter(title: "Refresh", default: .hourly)
    var interval: RefreshInterval
}
