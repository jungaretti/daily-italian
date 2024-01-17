//
//  Translation.swift
//  LanguageKit
//
//  Created by JP Ungaretti on 11/7/23.
//

import Foundation

public struct Translation {
    public let from: Word
    public let to: Word
    
    public init(from: Word, to: Word) {
        self.from = from
        self.to = to
    }
}
