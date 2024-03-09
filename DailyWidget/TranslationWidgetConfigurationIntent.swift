//
//  TranslationWidgetConfigurationIntent.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import AppIntents
import Foundation

enum RefreshIntervalParameter: String, AppEnum {
    case hourly = "hourly"
    case daily = "daily"

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Refresh Interval"
    static var caseDisplayRepresentations: [RefreshIntervalParameter : DisplayRepresentation] = [
        .hourly: "Every Hour",
        .daily: "Every Day",
    ]

    var timeInterval: TimeInterval {
        switch self {
        case .hourly:
            return 3600.0
        case .daily:
            return 86400.0
        }
    }
}

struct TranslationWidgetConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Translation"
    
    @Parameter(title: "Refresh", default: .hourly)
    var interval: RefreshIntervalParameter
}
