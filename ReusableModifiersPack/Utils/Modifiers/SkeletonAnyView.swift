//
//  SkeletonAnyView.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

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

