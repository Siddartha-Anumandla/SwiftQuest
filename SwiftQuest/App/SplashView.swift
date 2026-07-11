//
//  SplashView.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 10/07/26.
//

import SwiftUI

private enum Layout {
    static let logoWidthRatio: CGFloat = 0.8
    static let glowWidthRatio: CGFloat = 0.65
    static let glowOpacity: Double = 0.35
    static let glowBlurRadius: CGFloat = 50
    static let logoAnimationDuration = 0.7
    static let glowAnimationDuration = 1.5
}

struct SplashView: View {
    let onFinish: () -> Void
    @State private var isLogoAnimating = false
    @State private var isGlowAnimating = false

    var body: some View {
        ZStack {
            backgroundView
            logoGlow
            logoImage
        }
        .ignoresSafeArea()
        .onAppear {
            startAnimations()
        }
    }
    
    private func startAnimations() {
        Task {
            withAnimation(.easeOut(duration: Layout.logoAnimationDuration)) {
                isLogoAnimating = true
            }
            
            try? await Task.sleep(for: .seconds(Layout.logoAnimationDuration))
            
            withAnimation(
                .easeInOut(duration: Layout.glowAnimationDuration)
                .repeatForever(autoreverses: true)
            ) {
                isGlowAnimating = true
            }
            
            try? await Task.sleep(for: .seconds(0.8))
            
            await MainActor.run {
                onFinish()
            }
        }
    }

    private var backgroundView: some View {
        LinearGradient(
            colors: [
                SQColor.background.primary,
                SQColor.background.secondary
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    private var logoGlow: some View {
        Circle()
            .fill(SQColor.accent.logoGlow.opacity(0.34))
            .frame(
                width: Screen.width * Layout.glowWidthRatio,
                height: Screen.width * Layout.glowWidthRatio
            )
            .blur(radius: Layout.glowBlurRadius)
            .scaleEffect(isGlowAnimating ? 1.05 : 0.95)
            .opacity(isGlowAnimating ? 0.65 : 0.25)
    }

    private var logoImage: some View {
        Image(.splashLogo)
            .resizable()
            .scaledToFit()
            .frame(width: Screen.width * Layout.logoWidthRatio)
            .opacity(isLogoAnimating ? 1 : 0)
            .scaleEffect(isLogoAnimating ? 1 : 0.8)
    }
}

#Preview {
    SplashView {}
}
