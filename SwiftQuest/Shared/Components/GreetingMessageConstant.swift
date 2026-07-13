//
//  GreetingMessageConstant.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 12/07/26.
//

import Foundation

enum Greeting {
    static var message: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            return "Good Morning ☀️"
        case 12..<17:
            return "Good Afternoon 🌤️"
        case 17..<21:
            return "Good Evening 🌅"
        default:
            return "Good Night 🌙"
        }
    }
}
