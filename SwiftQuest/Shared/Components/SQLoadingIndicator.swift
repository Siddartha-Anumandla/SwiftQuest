//
//  SQLoadingIndicator.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 11/07/26.
//

import SwiftUI

private enum Layout {
    static let dotCount = 3
    static let dotSize: CGFloat = 12
    static let spacing: CGFloat = 8

    static let animationDuration = 0.25
    static let animationDelay = 400
}

struct SQLoadingIndicator: View {
    @State var activeColor: Color = .white
    @State private var activeIndex = 0
    @State private var animationTask: Task<Void, Never>?

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<Layout.dotCount, id: \.self) { index in
                Circle()
                    .fill(activeIndex == index ? activeColor : .gray.opacity(0.3))
                    .frame(width: Layout.dotSize, height: Layout.dotSize)
            }
        }
        .onAppear {
            animationTask = Task {
                await animateDots()
            }
        }
        .onDisappear {
            animationTask?.cancel()
        }
    }

    private func animateDots() async {
        while !Task.isCancelled {
            try? await Task.sleep(
                for: .milliseconds(Layout.animationDelay)
            )

            await MainActor.run {
                withAnimation(
                    .easeInOut(duration: Layout.animationDuration)
                ) {
                    activeIndex =
                        (activeIndex + 1) % Layout.dotCount
                }
            }
        }
    }
}

#Preview {
    SQLoadingIndicator()
}
