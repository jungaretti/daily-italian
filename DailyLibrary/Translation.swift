//
//  Translation.swift
//  DailyLibrary
//
//  Created by JP Ungaretti on 10/15/23.
//

import Foundation

public struct Translation {
    public var original: String
    public var translation: String
    public var language: Language
    
    public init(original: String, translation: String, language: Language) {
        self.original = original
        self.translation = translation
        self.language = language
    }
}
