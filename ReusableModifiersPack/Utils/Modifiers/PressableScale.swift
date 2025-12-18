//
//  PressableScale.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

/// A view modifier that applies a scale animation when the view is pressed.
///
/// Example usage:
/// ```swift
/// Button(action: {}) {
///     Text("Press Me")
/// }
/// .pressableScale()
/// ```
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
    /// Applies a pressable scale effect that animates when the view is pressed.
    ///
    /// - Parameters:
    ///   - scale: The scale factor when pressed. Default is 0.95 (5% smaller).
    ///   - animation: The animation to use for the scale effect. Default is a spring animation.
    /// - Returns: A modified view with pressable scale animation.
    public func pressableScale(
        scale: CGFloat = 0.95,
        animation: Animation = .spring(response: 0.3, dampingFraction: 0.6)
    ) -> some View {
        modifier(PressableScaleModifier(scale: scale, animation: animation))
    }
}

