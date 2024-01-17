import XCTest
@testable import CoreLanguage

final class CoreLanguageTests: XCTestCase {
    func testTranslationProviderRandomSingle() {
        let translation = Translation(from: (.English, "love"), to: (.Italian, "amore"))
        let translationProvider = TranslationProvider(translations: [translation])
        
        let randomTranslation = translationProvider.randomTranslation(from: .English, to: .Italian)
        XCTAssert(randomTranslation.from.language == .English)
        XCTAssert(randomTranslation.from.text == "love")
        XCTAssert(randomTranslation.to.language == .Italian)
        XCTAssert(randomTranslation.to.text == "amore")
    }

    func testTranslationProviderRandomItalian() {
        let translationProvider = globalProvider

        let randomTranslation = translationProvider.randomTranslation(from: .English, to: .Italian)
        XCTAssert(randomTranslation.from.language == .English)
        XCTAssert(randomTranslation.to.language == .Italian)
    }
}
