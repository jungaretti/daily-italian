//
//  TranslationProvider.swift
//
//
//  Created by JP Ungaretti on 8/19/24.
//

public protocol TranslationProvider {
    var hello: Translation { get }
    func random() -> Translation
}
