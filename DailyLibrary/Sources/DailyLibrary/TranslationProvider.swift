//
//  TranslationProvider.swift
//
//
//  Created by JP Ungaretti on 8/19/24.
//

public struct TranslationProvider {
    public let hello: Translation
    private let dictionary: [Translation]

    internal init(hello: Translation, dictionary: [Translation]) {
        self.hello = hello
        self.dictionary = dictionary
    }

    public func random() -> Translation {
        return dictionary.randomElement() ?? hello
    }
}
