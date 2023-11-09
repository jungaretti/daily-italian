//
//  Language.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

public enum Language {
    case Capybarian
    case English
    case Italian
    
    public var flagEmoji: Character {
        switch self {
        case .Capybarian:
            "🏴‍☠️"
        case .English:
            "🇺🇸"
        case .Italian:
            "🇮🇹"
        }
    }

    public var hello: Word {
        switch self {
        case .Capybarian:
            (self, "yo")
        case .English:
            (self, "hello")
        case .Italian:
            (self, "ciao")
        }
    }
}
