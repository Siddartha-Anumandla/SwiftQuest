//
//  AppColors.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 10/07/26.
//

import SwiftUI

// MARK: - SQColor Namespace

enum SQColor {
    static let background = BackgroundColors()
    static let accent = Accent()
    static let avatar = AvatarColors()
    static let text = TextColors()
    static let button = ButtonColors()
    static let status = StatusColors()
    static let game = GameColors()
    static let border = BorderColors()
}

// MARK: - Background
struct BackgroundColors {
    let primary = Color(hex: "#0B1020")
    let secondary = Color(hex: "#1A103D")
    let card = Color(hex: "#20253A")
}

struct BorderColors {
    let secondary = Color(hex: "#3A435C")
}

struct Accent {
    let logoGlow = Color(hex: "#7C5CFF")
}

// MARK: - Text
// MARK: - Text
struct TextColors {
    /// Main headings, usernames, card titles
    let primary = Color(hex: "#F8FAFC")

    /// Greeting, subtitles, descriptions
    let secondary = Color(hex: "#AEB8D4")

    /// Disabled text
    let disabled = Color(hex: "#6B7280")

    /// Placeholder text
    let placeholder = Color(hex: "#7C86A8")

    /// Text shown on accent-colored buttons
    let onAccent = Color.white

    /// Success (completed lessons, achievements)
    let success = Color(hex: "#4ADE80")

    /// Warning (streaks)
    let warning = Color(hex: "#FBBF24")

    /// Error
    let error = Color(hex: "#F87171")
}

// MARK: - Button
struct ButtonColors {
    let primary = Color(hex: "#7C4DFF")
    let secondary = Color.gray
    let destructive = Color.red
}

// MARK: - Status
struct StatusColors {
    let success = Color.green
    let warning = Color.orange
    let error = Color.red
}

// MARK: - Game
struct GameColors {
    let experience = Color(hex: "#FFD700")
    let streak = Color(hex: "#FF6A00")
}

struct AvatarColors {
    // MARK: - Gradient Colors
    let gradientStart = Color(hex: "#FF4FD8")
    let gradientMiddle = Color(hex: "#C55BFF")
    let gradientEnd = Color(hex: "#6F5BFF")
    let gradientAccent = Color(hex: "#7E3BFF")
    
    // MARK: - Other Colors
    
    let glow = Color(hex: "#A855F7")
    let editButtonBackground = Color.white
    let editIcon = Color.black
    
    // MARK: - Gradients
    
    var ringGradient: AngularGradient {
        AngularGradient(
            colors: [
                gradientStart,
                gradientMiddle,
                gradientEnd,
                gradientAccent,
                gradientStart
            ],
            center: .center
        )
    }
}
