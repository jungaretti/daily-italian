//
//  TranslationProvider.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/15/23.
//

import Foundation

public struct TranslationProvider {
    private let translations: [Translation]
    
    public init(translations: [Translation]) {
        self.translations = translations
    }
    
    public func getRandomTranslation() -> Translation? {
        return translations.randomElement();
    }
}
