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
    static let text = TextColors()
    static let button = ButtonColors()
    static let status = StatusColors()
    static let game = GameColors()
}

// MARK: - Background
struct BackgroundColors {
    let primary = Color(hex: "#0B1020")
    let secondary = Color(hex: "#1A103D")
    let card = Color(hex: "#20253A")
}

struct Accent {
    let logoGlow = Color(hex: "#7C5CFF")
}

// MARK: - Text
struct TextColors {
    let primary = Color.white
    let secondary = Color(hex: "#B7BBD1")
    let disabled = Color.gray
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
