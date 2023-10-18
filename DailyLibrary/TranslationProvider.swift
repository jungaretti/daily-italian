//
//  TranslationProvider.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/15/23.
//

import Foundation

public struct TranslationProvider {
    public let language: Language
    private let translations: [Translation]
    
    public init(language: Language, translations: [Translation]) {
        self.language = language
        self.translations = translations
    }
    
    public func getRandomTranslation() -> Translation {
        return translations.randomElement()!;
    }
}
