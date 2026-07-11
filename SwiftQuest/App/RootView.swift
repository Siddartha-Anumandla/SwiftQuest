//
//  RootView.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 10/07/26.
//

import SwiftUI

enum RootScene {
    case launching
    case home
}

struct RootView: View {
    @State private var currentScene: RootScene = .launching
    var body: some View {
        switch currentScene {
        case .launching:
            SplashView {
                currentScene = .home
            }
        case .home:
            HomeView()
        }
    }
}

#Preview {
    RootView()
}
