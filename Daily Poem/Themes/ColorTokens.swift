//
//  ColorTokens.swift
//  Daily Poem
//

import SwiftUI

extension Color {
    // MARK: - Base Palette
    static let poemNavy       = Color(hex: "#0F1B2D") // Page background
    static let poemCard       = Color(hex: "#162236") // Card surface
    static let poemCardDeep   = Color(hex: "#0D1825") // Pressed / deeper card
    static let poemGold       = Color(hex: "#C9A84C") // Primary accent
    static let poemGoldMuted  = Color(hex: "#C9A84C").opacity(0.35) // Drop quote, decorative
    static let poemGoldSubtle = Color(hex: "#C9A84C").opacity(0.12) // Button tint, icon bg
    static let poemIvory      = Color(hex: "#F5EED7") // Primary text (titles)
    static let poemParchment  = Color(hex: "#C8BEAA") // Excerpt / body text
    static let poemSage       = Color(hex: "#7A9E8E") // Secondary icon (unfavorited heart)
    static let poemRose       = Color(hex: "#E85D75") // Favorited heart
    static let poemBorder     = Color(hex: "#C9A84C").opacity(0.18) // Card border
    static let poemDivider    = Color(hex: "#C9A84C").opacity(0.15) // Intra-card divider
    static let poemMeta       = Color(hex: "#C9A84C").opacity(0.50) // Line count label
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
