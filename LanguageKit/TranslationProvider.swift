//
//  TranslationProvider.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

private struct TranslationKey: Hashable {
    let from: Language
    let to: Language
}

public struct TranslationProvider {
    private let translations: Dictionary<TranslationKey, [Translation]>
    
    public init(translations: [Translation]) {
        self.translations = Dictionary(grouping: translations, by: { translation in
            return TranslationKey(from: translation.from.language, to: translation.to.language)
        })
    }

    public func randomTranslation(from: Language, to: Language) -> Translation {
        let translationKey = TranslationKey(from: from, to: to)
        let randomTranslation = translations[translationKey]?.randomElement()
        print("Selected random translation: \(String(describing: randomTranslation))")

        return randomTranslation ?? defaultTranslation(from: from, to: to)
    }

    private func defaultTranslation(from: Language, to: Language) -> Translation {
        return Translation(from: from.hello, to: to.hello)
    }
}

public let globalProvider = TranslationProvider(translations: italianTranslations)
