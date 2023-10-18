//
//  DailyLibraryTests.swift
//  DailyLibraryTests
//
//  Created by JP Ungaretti on 10/15/23.
//

import XCTest
@testable import DailyLibrary

class DailyLibraryTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTranslationProviderGetRandomTranslation() {
        let mockTranslation = Translation(original: "hello", translation: "ciao")
        
        let translations = [mockTranslation]
        let provider = TranslationProvider(translations: translations)
        let randomTranslation = provider.getRandomTranslation()
        
        XCTAssertEqual(mockTranslation.original, randomTranslation?.original)
        XCTAssertEqual(mockTranslation.translation, randomTranslation?.translation)
    }
}
