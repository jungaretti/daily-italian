import Foundation

public enum Language: String, Hashable {
    case Capybarian = "capybarian"
    case English = "english"
    case Italian = "italian"
    
    public var flagEmoji: Character {
        switch self {
        case .Capybarian:
            "🏴‍☠️"
        case .English:
            "🇺🇸"
        case .Italian:
            "🇮🇹"
        }
    }

    public var hello: Word {
        switch self {
        case .Capybarian:
            (self, "yo")
        case .English:
            (self, "hello")
        case .Italian:
            (self, "ciao")
        }
    }
}
