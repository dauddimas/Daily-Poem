//
//  TypographyTokens.swift
//  Daily Poem
//
//  Uses New York (Apple's built-in serif) for literary content,
//  system sans-serif for all UI chrome and metadata.
//

import SwiftUI

// MARK: - Font Roles

enum PoemFont {
    // Literary — titles, excerpts, drop quote
    case displayTitle       // Nav "Discover" heading
    case poemTitle          // Card poem title
    case poemTitleSmall     // Compact variant
    case excerpt            // Italic body of poem excerpt
    case dropQuote          // Oversized decorative opening "

    // UI chrome — always system sans
    case author             // "by Robert Frost"
    case meta               // "44 lines · 4 stanzas"
    case readButton         // "Read full poem" pill label
    case navButton          // Toolbar button label

    var font: Font {
        switch self {
        case .displayTitle:
            return .system(.largeTitle, design: .serif).weight(.semibold)
        case .poemTitle:
            return .system(.headline, design: .serif).weight(.semibold)
        case .poemTitleSmall:
            return .system(.subheadline, design: .serif).weight(.semibold)
        case .excerpt:
            return Font.system(.body, design: .serif).italic()
        case .dropQuote:
            return Font.system(size: 56, weight: .semibold, design: .serif)
        case .author:
            return .system(.caption, weight: .medium)
        case .meta:
            return .system(size: 11, weight: .regular)
        case .readButton:
            return .system(size: 12, weight: .medium)
        case .navButton:
            return .system(.body)
        }
    }
}

// MARK: - View Modifier

struct PoemFontModifier: ViewModifier {
    let role: PoemFont
    func body(content: Content) -> some View {
        content.font(role.font)
    }
}

extension View {
    func poemFont(_ role: PoemFont) -> some View {
        self.modifier(PoemFontModifier(role: role))
    }
}
