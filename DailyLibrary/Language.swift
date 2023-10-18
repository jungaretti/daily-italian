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
        switch self {
        case .Italian:
            "🇮🇹"
        }
    }
    
    public var hello: Translation {
        switch self {
        case .Italian:
            Translation(original: "hello", translation: "ciao", language: .Italian)
        }
    }
}
