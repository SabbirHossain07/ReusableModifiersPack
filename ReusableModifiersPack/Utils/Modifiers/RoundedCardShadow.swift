//
//  RoundedCardShadow.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

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

