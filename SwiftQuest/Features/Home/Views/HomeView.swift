//
//  ContentView.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 09/07/26.
//

import SwiftUI

private enum Layout {
    static let horizontalPadding: CGFloat = 20
    static let topPadding: CGFloat = 16
    static let bottomPadding: CGFloat = 32
    static let sectionSpacing: CGFloat = 24
}

struct HomeView: View {
    @State private var selectedAvatar: Avatar = .male
    @State private var showAvatarSelection = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Layout.sectionSpacing) {
                HomeHeaderView(
                    userName: "Alex..",
                    selectedAvatar: selectedAvatar,
                    onProfileTap: {
                        showAvatarSelection = true
                    }
                )
            }
            .padding(.horizontal, Layout.horizontalPadding)
            .padding(.top, Layout.topPadding)
            .padding(.bottom, Layout.bottomPadding)
        }
        .background(SQColor.background.primary)
        .sheet(isPresented: $showAvatarSelection) {
            AvatarSelectionView(selectedAvatar: $selectedAvatar)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    HomeView()
}
