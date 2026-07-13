//
//  SQTypography.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 12/07/26.
//

import SwiftUI

enum SQTypography {

    // MARK: - Navigation
    static let navigationTitle = Font.largeTitle.bold()
    static let screenTitle = Font.title.bold()

    // MARK: - Header
    static let greeting = Font.subheadline.weight(.medium)
    static let userName = Font.title3.weight(.bold)
    static let subtitle = Font.callout

    // MARK: - Cards
    static let cardTitle = Font.headline.weight(.semibold)
    static let cardSubtitle = Font.subheadline

    // MARK: - Buttons
    static let button = Font.headline.weight(.semibold)

    // MARK: - Body
    static let body = Font.body
    static let bodyBold = Font.body.weight(.semibold)

    // MARK: - Caption
    static let caption = Font.caption
    static let smallCaption = Font.caption2
}
