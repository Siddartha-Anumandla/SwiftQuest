//
//  Avatar.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 12/07/26.
//

import SwiftUI

enum Avatar: String, CaseIterable, Identifiable {

    // MARK: - Default Avatars

    case male
    case female

    // MARK: - Unlockable Avatars

    case bear
    case eagle
    case elephant
    case fox
    case lion
    case monkey
    case panda
    case robot
    case tiger
    case wolf
    // MARK: - Identifiable

    var id: String {
        rawValue
    }

    // MARK: - Asset Name

    var imageName: String {
        "\(rawValue)Avatar"
    }

    // MARK: - SwiftUI Image

    var image: Image {
        Image(imageName)
    }

    // MARK: - Display Name

    var title: String {
        switch self {
        case .male:        return "Male"
        case .female:      return "Female"
        case .bear:        return "Bear"
        case .eagle:       return "Eagle"
        case .elephant:    return "Elephant"
        case .fox:         return "Fox"
        case .lion:        return "Lion"
        case .monkey:      return "Monkey"
        case .panda:       return "Panda"
        case .robot:       return "Robot"
        case .tiger:       return "Tiger"
        case .wolf:        return "Wolf"
        }
    }

    // MARK: - Default Avatar

    var isDefault: Bool {
        self == .male || self == .female
    }

//    var isLocked: Bool {
//        unlockLevel > currentUserLevel
//    }
    // MARK: - Unlock Level

    var unlockLevel: Int {
        switch self {
        case .male, .female:
            return 1

        case .bear:
            return 3

        case .fox:
            return 5

        case .monkey:
            return 8

        case .eagle:
            return 10

        case .lion:
            return 12

        case .wolf:
            return 15

        case .tiger:
            return 18

        case .elephant:
            return 22

        case .panda:
            return 25

        case .robot:
            return 30
        }
    }
}
