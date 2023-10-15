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

    func testTranslation() {
        let ciaoTranslation = Translation(original: "hello", translation: "ciao")
        
        XCTAssertEqual("hello", ciaoTranslation.original)
        XCTAssertEqual("ciao", ciaoTranslation.translation)
    }
    
    func testTranslationProviderExtension() {
        let provider = ItalianTranslationProvider()
        let translation = provider.randomTranslation()
        
        let dictionaryContainsTranslation = provider.dictionary.contains(where: { $0.original == translation?.original && $0.translation == translation?.translation })
        XCTAssertTrue(dictionaryContainsTranslation)
    }
}
