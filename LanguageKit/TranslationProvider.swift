//
//  TranslationProvider.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

public struct TranslationProvider {
    private let translations: [Translation]
    
    public init(translations: [Translation]) {
        self.translations = translations
    }
    
    public func randomTranslations(from: Language, to: Language) -> Translation? {
        let possibleTranslations = translations.filter({ $0.from.language == from && $0.to.language == to })
        return possibleTranslations.randomElement()
    }

    public func helloTranslation(from: Language, to: Language) -> Translation {
        switch from {
        case .English:
            return Translation(from: (.English, "hello"), to: (.Italian, "ciao"))
        case .Italian:
            return Translation(from: (.Italian, "ciao"), to: (.English, "hello"))
        }
    }
}

public let globalProvider = TranslationProvider(translations: italianTranslations)
