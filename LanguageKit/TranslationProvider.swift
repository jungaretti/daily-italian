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

    public func randomTranslation(from: Language, to: Language) -> Translation {
        let possibleTranslations = translations.filter({ $0.from.language == from && $0.to.language == to })
        return possibleTranslations.randomElement() ?? defaultTranslation(from: from, to: to)
    }

    private func defaultTranslation(from: Language, to: Language) -> Translation {
        return Translation(from: from.hello, to: to.hello)
    }
}

public let globalProvider = TranslationProvider(translations: italianTranslations)
