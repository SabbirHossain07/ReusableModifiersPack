//
//  PressableScale.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

public struct PressableScaleModifier: ViewModifier {
    @State private var isPressed = false
    
    let scale: CGFloat
    let animation: Animation
    
    public init(
        scale: CGFloat = 0.95,
        animation: Animation = .spring(response: 0.3, dampingFraction: 0.6)
    ) {
        self.scale = scale
        self.animation = animation
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? scale : 1.0)
            .animation(animation, value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isPressed = true
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
            )
    }
}

extension View {

    public func pressableScale(
        scale: CGFloat = 0.95,
        animation: Animation = .spring(response: 0.3, dampingFraction: 0.6)
    ) -> some View {
        modifier(PressableScaleModifier(scale: scale, animation: animation))
    }
}

