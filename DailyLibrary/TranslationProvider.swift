//
//  TranslationProvider.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/15/23.
//

import Foundation

public struct TranslationProvider {
    private let translations: Dictionary<Language, [Translation]>
    
    public init(translations: [Translation]) {
        self.translations = Dictionary(grouping: translations, by: { $0.language })
    }
    
    public func randomTranslation(to: Language) -> Translation? {
        return translations[to]?.randomElement()
    }
}

public let globalProvider = TranslationProvider(translations: italianTranslations)
