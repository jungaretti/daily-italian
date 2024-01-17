import Foundation

private struct TranslationKey: Hashable {
    let from: Language
    let to: Language
}

public struct TranslationProvider {
    private let translations: Dictionary<TranslationKey, [Translation]>
    
    public init(translations: [Translation]...) {
        self.translations = Dictionary(grouping: translations.joined(), by: { translation in
            return TranslationKey(from: translation.from.language, to: translation.to.language)
        })
    }

    /// Picks a random translation from a language to another language.
    /// If no translations exist that satisfy the request, then returns a hello-to-hello translation.
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
