//
//  RoundedCardShadow.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

/// A view modifier that applies rounded corners and a subtle shadow to create a card-like appearance.
///
/// Example usage:
/// ```swift
/// Text("Card Content")
///     .roundedCardShadow(cornerRadius: 16, shadowRadius: 8)
/// ```
public struct RoundedCardShadowModifier: ViewModifier {
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat
    let shadowColor: Color
    let shadowOpacity: Double
    let backgroundColor: Color
    
    public init(
        cornerRadius: CGFloat = 12,
        shadowRadius: CGFloat = 8,
        shadowColor: Color = .black,
        shadowOpacity: Double = 0.1,
        backgroundColor: Color = .white
    ) {
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(
                color: shadowColor.opacity(shadowOpacity),
                radius: shadowRadius,
                x: 0,
                y: 2
            )
    }
}

extension View {
    /// Applies a rounded card shadow effect to the view.
    ///
    /// - Parameters:
    ///   - cornerRadius: The radius of the rounded corners. Default is 12.
    ///   - shadowRadius: The blur radius of the shadow. Default is 8.
    ///   - shadowColor: The color of the shadow. Default is black.
    ///   - shadowOpacity: The opacity of the shadow. Default is 0.1.
    ///   - backgroundColor: The background color of the card. Default is white.
    /// - Returns: A modified view with rounded corners and shadow.
    public func roundedCardShadow(
        cornerRadius: CGFloat = 12,
        shadowRadius: CGFloat = 8,
        shadowColor: Color = .black,
        shadowOpacity: Double = 0.1,
        backgroundColor: Color = .white
    ) -> some View {
        modifier(RoundedCardShadowModifier(
            cornerRadius: cornerRadius,
            shadowRadius: shadowRadius,
            shadowColor: shadowColor,
            shadowOpacity: shadowOpacity,
            backgroundColor: backgroundColor
        ))
    }
}

