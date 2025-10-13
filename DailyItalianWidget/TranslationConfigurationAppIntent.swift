//
//  TranslationConfigurationAppIntent.swift
//  DailyWidget
//
//  Created by JP Ungaretti on 10/6/25.
//

import WidgetKit
import AppIntents

enum RefreshIntervalParameter: String, AppEnum {
    case fiveMinutes = "5m"
    case hour = "1h"
    case fourHours = "4h"

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Refresh Interval"
    static var caseDisplayRepresentations: [RefreshIntervalParameter : DisplayRepresentation] = [
        .fiveMinutes: "Every 5 Minutes",
        .hour: "Every Hour",
        .fourHours: "Every 4 Hours",
    ]

    var timeInterval: TimeInterval {
        switch self {
        case .fiveMinutes:
            return 300.0
        case .hour:
            return 3600.0
        case .fourHours:
            return 14400.0
        }
    }
}

struct TranslationConfigurationAppIntent: WidgetConfigurationIntent {
    static let persistentIdentifier = "TranslationWidgetConfigurationIntent"

    static var title: LocalizedStringResource = "Translation"
    static var description = IntentDescription("Shows a random translation.")

    @Parameter(title: "Refresh", default: .hour)
    var interval: RefreshIntervalParameter
}
