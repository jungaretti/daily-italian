//
//  LanguageKitTests.swift
//  LanguageKitTests
//
//  Created by JP Ungaretti on 11/7/23.
//

import XCTest
@testable import LanguageKit

class LanguageKitTests: XCTestCase {
    func testTranslationProviderRandomSingle() {
        let translation = Translation(from: (.English, "love"), to: (.Italian, "amore"))
        let translationProvider = TranslationProvider(translations: [translation])
        
        let randomTranslation = translationProvider.randomTranslation(from: .English, to: .Italian)
        XCTAssert(randomTranslation?.from.language == .English)
        XCTAssert(randomTranslation?.from.text == "love")
        XCTAssert(randomTranslation?.to.language == .Italian)
        XCTAssert(randomTranslation?.to.text == "amore")
    }

    func testTranslationProviderRandomItalian() {
        let translationProvider = globalProvider

        let randomTranslation = translationProvider.randomTranslation(from: .English, to: .Italian)
        XCTAssert(randomTranslation?.from.language == .English)
        XCTAssert(randomTranslation?.to.language == .Italian)
    }
}
