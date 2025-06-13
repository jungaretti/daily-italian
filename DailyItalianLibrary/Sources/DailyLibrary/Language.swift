//
//  Language.swift
//  
//
//  Created by JP Ungaretti on 8/15/24.
//

public enum Language {
    case english
    case italian
    
    public var flagEmoji: String {
        switch self {
        case .english:
            "🇺🇸"
        case .italian:
            "🇮🇹"
        }
    }
}
