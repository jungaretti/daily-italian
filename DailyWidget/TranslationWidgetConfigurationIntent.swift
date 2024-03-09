//
//  TranslationWidgetConfigurationIntent.swift
//  DailyWidgetExtension
//
//  Created by JP Ungaretti on 3/9/24.
//

import AppIntents

enum RefreshIntervalParameter: String, AppEnum {
    case hourly, daily

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Refresh Interval"
    static var caseDisplayRepresentations: [RefreshIntervalParameter : DisplayRepresentation] = [
        .hourly: "Every Hour",
        .daily: "Every Day",
    ]
}

struct TranslationWidgetConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Translation"
    
    @Parameter(title: "Refresh", default: .hourly)
    var interval: RefreshIntervalParameter
}
