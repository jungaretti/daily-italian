//
//  TranslationWidgetConfigurationIntent.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import AppIntents
import Foundation

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

struct TranslationWidgetConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Translation"
    
    @Parameter(title: "Refresh", default: .hour)
    var interval: RefreshIntervalParameter
}
