//
//  HomeHeaderView.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 11/07/26.
//

import SwiftUI

struct HomeHeaderView: View {
    let userName: String
    let selectedAvatar: Avatar
    var onProfileTap: (() -> Void)?
    
    private var greeting: String {
        Greeting.message
    }

    private var subtitle: String {
        "Ready for today's Swift challenge?"
    }

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            avatarImageView
            greetingView
            Spacer()
        }
    }
    
    private var avatarImageView: some View {
        Button {
            onProfileTap?()
        } label: {
            ProfileAvatarView(avatar: selectedAvatar)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Profile")
        .accessibilityHint("Opens your profile")
    }
    
    private var greetingView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(greeting)
                .font(SQTypography.greeting)
                .foregroundStyle(SQColor.text.secondary)
            
            Text(userName)
                .font(SQTypography.userName)
                .foregroundStyle(SQColor.text.primary)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Text(subtitle)
                .font(SQTypography.subtitle)
                .foregroundStyle(SQColor.text.secondary)
        }
    }
}

#Preview {
    HomeHeaderView(
        userName: "Siddharth",
        selectedAvatar: .eagle,
        onProfileTap: {}
    )
    .padding()
    .background(SQColor.background.primary)
}

private enum Constants {
    static let ringSize: CGFloat = 72
    static let avatarSize: CGFloat = 64

    static let ringLineWidth: CGFloat = 2.5
    static let badgeLineWidth: CGFloat = 2

    static let editBadgeSize: CGFloat = 22
    static let pencilIconSize: CGFloat = 12

    static let badgeOffset: CGFloat = 2

    static let glowRadius: CGFloat = 8
    static let outerGlowRadius: CGFloat = 18
}

private struct ProfileAvatarView: View {
    let avatar: Avatar

    var body: some View {
        avatarContent
    }

    // MARK: - Avatar Content

    private var avatarContent: some View {
        ZStack {
            glowRing
            profileAvatarImage
        }
        .frame(
            width: Constants.ringSize,
            height: Constants.ringSize
        )
        .overlay(alignment: .bottomTrailing) {
            editBadgeView
                .offset(x: 2, y: 2)
        }
    }

    // MARK: - Glow Ring

    private var glowRing: some View {
        Circle()
            .stroke(
                SQColor.avatar.ringGradient,
                lineWidth: Constants.ringLineWidth
            )
            .shadow(
                color: SQColor.avatar.glow.opacity(0.8),
                radius: Constants.glowRadius
            )
            .shadow(
                color: SQColor.avatar.glow.opacity(0.35),
                radius: Constants.outerGlowRadius
            )
    }

    // MARK: - Avatar Image

    private var profileAvatarImage: some View {
        avatar.image
            .resizable()
            .scaledToFill()
            .frame(
                width: Constants.ringSize,
                height: Constants.ringSize
            )
            .clipShape(Circle())
    }

    // MARK: - Edit Badge

    private var editBadgeView: some View {
        Circle()
            .fill(SQColor.background.primary)
            .overlay {
                Circle()
                    .stroke(
                        SQColor.avatar.ringGradient,
                        lineWidth: Constants.badgeLineWidth
                    )
            }
            .overlay {
                Image(.pencil)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.pencilIconSize,
                        height: Constants.pencilIconSize
                    )
            }
            .frame(
                width: Constants.editBadgeSize,
                height: Constants.editBadgeSize
            )
            .shadow(
                color: SQColor.avatar.glow.opacity(0.4),
                radius: 4
            )
    }
}
