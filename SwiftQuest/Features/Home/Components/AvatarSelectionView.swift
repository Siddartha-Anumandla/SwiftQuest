//
//  AvatarSelectionView.swift
//  SwiftQuest
//
//  Created by Siddartha Anumandla on 12/07/26.
//

import SwiftUI

private enum Constants {
    
    static let ringLineWidth: CGFloat = 2.5
    static let badgeLineWidth: CGFloat = 2
    
    static let badgeOffset: CGFloat = -2
    
    static let glowRadius: CGFloat = 8
    static let outerGlowRadius: CGFloat = 18
    
    static let badgeSize: CGFloat = 22
    static let badgeIconSize: CGFloat = 12
    
    static let numberOfColumns = 3
    static let columnSpacing: CGFloat = 20
    static let horizontalPadding: CGFloat = 20
    static let rowSpacing: CGFloat = 24
    static let badgeShadowRadius: CGFloat = 4
    static let contentSpacing: CGFloat = 20
    
    static var ringSize: CGFloat {
        let totalPadding = horizontalPadding * 2
        let totalSpacing = columnSpacing * CGFloat(numberOfColumns - 1)
        
        return (Screen.width - totalPadding - totalSpacing) / CGFloat(numberOfColumns)
    }
    
    static var avatarSize: CGFloat {
        ringSize * 0.9
    }

    static let gridColumns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: columnSpacing),
        count: numberOfColumns
    )
}

struct AvatarSelectionView: View {
    @Binding var selectedAvatar: Avatar

    var body: some View {
        VStack(alignment: .center, spacing: Constants.contentSpacing) {
            headerTextView
            avatarGrid
                .padding(.horizontal, Constants.horizontalPadding)
        }
        .background(SQColor.background.primary)
        
    }
    
    private var headerTextView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("Choose Your Avatar")
                .font(SQTypography.screenTitle)
                .foregroundStyle(SQColor.text.onAccent)
            Text("Pick a hero that represents you")
                .font(SQTypography.subtitle)
                .foregroundStyle(SQColor.text.onAccent.opacity(0.5))
        }
        .padding(.top)
    }
    
    private var avatarGrid: some View {
        ScrollView {
            LazyVGrid(
                columns: Constants.gridColumns,
                spacing: Constants.rowSpacing
            ) {
                ForEach(Avatar.allCases) { avatar in
                    AvatarGridCell(
                        avatar: avatar,
                        isSelected: avatar == selectedAvatar,
                        isLocked: !avatar.isDefault
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            if avatar.isDefault {
                                selectedAvatar = avatar
                            }
                        }
                    }
                }
            }
            .padding(.all, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 24)
    }
}

private struct AvatarGridCell: View {
    var avatar: Avatar
    let isSelected: Bool
    let isLocked: Bool

    var body: some View {
        avatarContent
    }
    
    // MARK: - Avatar Content
    
    private var avatarContent: some View {
        ZStack {
            avatarRing
            profileAvatarImage
        }
        .frame(
            width: Constants.ringSize,
            height: Constants.ringSize
        )
        .overlay(alignment: .bottomTrailing) {
            if isLocked {
                lockBadgeView
                    .offset(
                        x: Constants.badgeOffset,
                        y: Constants.badgeOffset
                    )
            }
        }
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(
            .spring(response: 0.25, dampingFraction: 0.85),
            value: isSelected
        )
    }
    
    // MARK: - avatar Ring
    
    private var avatarRing: some View {
        Circle()
            .stroke(
                lineWidth: isSelected && !isLocked
                    ? Constants.ringLineWidth
                    : 1.5
            )
            .foregroundStyle(
                isSelected && !isLocked
                    ? AnyShapeStyle(SQColor.avatar.ringGradient)
                    : AnyShapeStyle(SQColor.border.secondary)
            )
            .shadow(
                color: isSelected && !isLocked
                    ? SQColor.avatar.glow.opacity(0.35)
                    : .clear,
                radius: 4
            )
            .shadow(
                color: isSelected && !isLocked
                    ? SQColor.avatar.glow.opacity(0.15)
                    : .clear,
                radius: 8
            )
    }
    
    // MARK: - Avatar Image
    
    private var profileAvatarImage: some View {
        avatar.image
            .resizable()
            .scaledToFill()
            .frame(
                width: Constants.avatarSize,
                height: Constants.avatarSize
            )
            .clipShape(Circle())
    }
    
    // MARK: - Lock Badge
    
    private var lockBadgeView: some View {
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
                Image(.lockIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.badgeIconSize,
                        height: Constants.badgeIconSize
                    )
            }
            .frame(
                width: Constants.badgeSize,
                height: Constants.badgeSize
            )
            .shadow(
                color: SQColor.avatar.glow.opacity(0.4),
                radius: Constants.badgeShadowRadius
            )
    }
}


#Preview {
    AvatarSelectionView(selectedAvatar: .constant(.male))
}
