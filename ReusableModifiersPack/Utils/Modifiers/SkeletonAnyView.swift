//
//  SkeletonAnyView.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

/// A view modifier that displays a skeleton loading state overlay.
///
/// Example usage:
/// ```swift
/// Text("Content")
///     .skeleton(isLoading: isLoading)
/// ```
public struct SkeletonAnyViewModifier: ViewModifier {
    let isLoading: Bool
    let cornerRadius: CGFloat
    let shimmer: Bool
    let shimmerColor: Color
    
    @State private var shimmerOffset: CGFloat = -200
    
    public init(
        isLoading: Bool,
        cornerRadius: CGFloat = 8,
        shimmer: Bool = true,
        shimmerColor: Color = Color.white.opacity(0.6)
    ) {
        self.isLoading = isLoading
        self.cornerRadius = cornerRadius
        self.shimmer = shimmer
        self.shimmerColor = shimmerColor
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            if isLoading {
                skeletonView
                    .transition(.opacity)
            } else {
                content
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isLoading)
    }
    
    private var skeletonView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color.gray.opacity(0.2))
            .overlay(
                Group {
                    if shimmer {
                        shimmerOverlay
                    }
                }
            )
            .onAppear {
                if shimmer {
                    startShimmerAnimation()
                }
            }
    }
    
    private var shimmerOverlay: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.clear,
                shimmerColor,
                Color.clear
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .offset(x: shimmerOffset)
        .blur(radius: 20)
    }
    
    private func startShimmerAnimation() {
        withAnimation(
            Animation.linear(duration: 1.5)
                .repeatForever(autoreverses: false)
        ) {
            shimmerOffset = 400
        }
    }
}

extension View {
    /// Applies a skeleton loading state overlay to the view.
    ///
    /// - Parameters:
    ///   - isLoading: A boolean that determines whether to show the skeleton or the actual content.
    ///   - cornerRadius: The corner radius of the skeleton. Default is 8.
    ///   - shimmer: Whether to show a shimmer animation. Default is true.
    ///   - shimmerColor: The color of the shimmer effect. Default is white with 60% opacity.
    /// - Returns: A modified view that shows a skeleton loading state when isLoading is true.
    public func skeleton(
        isLoading: Bool,
        cornerRadius: CGFloat = 8,
        shimmer: Bool = true,
        shimmerColor: Color = Color.white.opacity(0.6)
    ) -> some View {
        modifier(SkeletonAnyViewModifier(
            isLoading: isLoading,
            cornerRadius: cornerRadius,
            shimmer: shimmer,
            shimmerColor: shimmerColor
        ))
    }
}

