//
//  Color+Extension.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 10/07/26.
//

import SwiftUI

extension Color {

    init(hex: String) {
        let hex = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
            .uppercased()
        
        var value: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&value)
        
        switch hex.count {
        case 3:
            let r = Double((value >> 8) & 0xF) / 15.0
            let g = Double((value >> 4) & 0xF) / 15.0
            let b = Double(value & 0xF) / 15.0
            
            self.init(
                red: r,
                green: g,
                blue: b
            )
        case 6:
            let r = Double((value >> 16) & 0xFF) / 255.0
            let g = Double((value >> 8) & 0xFF) / 255.0
            let b = Double(value & 0xFF) / 255.0
            
            self.init(
                red: r,
                green: g,
                blue: b
            )
        case 8:
            let a = Double((value >> 24) & 0xFF) / 255.0
            let r = Double((value >> 16) & 0xFF) / 255.0
            let g = Double((value >> 8) & 0xFF) / 255.0
            let b = Double(value & 0xFF) / 255.0
            
            self.init(
                .sRGB,
                red: r,
                green: g,
                blue: b,
                opacity: a
            )
        default:
            self.init(.clear)
        }
    }
}
