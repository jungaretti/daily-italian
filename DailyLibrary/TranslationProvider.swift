//
//  TranslationProvider.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/15/23.
//

import Foundation

public protocol TranslationProvider {
    var dictionary: [Translation] { get }
}

public extension TranslationProvider {
    func randomTranslation() -> Translation? {
        return dictionary.randomElement();
    }
}
