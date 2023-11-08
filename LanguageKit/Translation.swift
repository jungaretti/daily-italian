//
//  Translation.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

public struct Translation {
    public let from: (language: Language, text: String)
    public let to: (language: Language, text: String)
    
    public init(from: (Language, String), to: (Language, String)) {
        self.from = from
        self.to = to
    }
}
