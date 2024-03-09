import Foundation

public struct Translation {
    public let from: Word
    public let to: Word
    
    public init(from: Word, to: Word) {
        self.from = from
        self.to = to
    }
}
