//
//  Language.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

public enum Language {
    case English
    case Italian
    
    public var flagEmoji: Character {
        switch self {
        case .English:
            "🇺🇸"
        case .Italian:
            "🇮🇹"
        }
    }
}
