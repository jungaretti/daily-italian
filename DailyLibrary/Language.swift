//
//  Language.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/17/23.
//

import Foundation

public enum Language {
    case Italian
    
    public var emoji: String {
        get {
            switch self {
            case .Italian:
                "🇮🇹"
            }
        }
    }
}
