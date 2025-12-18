//
//  ShakeOnError.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

/// A view modifier that applies a shake animation when an error state is triggered.
///
/// Example usage:
/// ```swift
/// TextField("Email", text: $email)
///     .shakeOnError(isError: $showError)
/// ```
public struct ShakeOnErrorModifier: ViewModifier {
    @Binding var isError: Bool
    @State private var shakeOffset: CGFloat = 0
    
    let shakeCount: Int
    let shakeAmount: CGFloat
    let animationDuration: Double
    
    public init(
        isError: Binding<Bool>,
        shakeCount: Int = 4,
        shakeAmount: CGFloat = 10,
        animationDuration: Double = 0.5
    ) {
        self._isError = isError
        self.shakeCount = shakeCount
        self.shakeAmount = shakeAmount
        self.animationDuration = animationDuration
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: shakeOffset)
            .onChange(of: isError) { newValue in
                if newValue {
                    performShake()
                }
            }
    }
    
    private func performShake() {
        let stepDuration = animationDuration / Double(shakeCount * 2)
        
        func animateStep(step: Int) {
            withAnimation(.linear(duration: stepDuration)) {
                shakeOffset = step % 2 == 0 ? -shakeAmount : shakeAmount
            }
            
            if step < shakeCount * 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + stepDuration) {
                    animateStep(step: step + 1)
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + stepDuration) {
                    withAnimation(.linear(duration: stepDuration)) {
                        shakeOffset = 0
                    }
                }
            }
        }
        
        animateStep(step: 1)
    }
}

extension View {
    /// Applies a shake animation when the error state changes to true.
    ///
    /// - Parameters:
    ///   - isError: A binding to a boolean that triggers the shake when set to true.
    ///   - shakeCount: The number of shakes. Default is 4.
    ///   - shakeAmount: The amount of horizontal offset for the shake. Default is 10.
    ///   - animationDuration: The total duration of the shake animation. Default is 0.5 seconds.
    /// - Returns: A modified view that shakes when an error occurs.
    public func shakeOnError(
        isError: Binding<Bool>,
        shakeCount: Int = 4,
        shakeAmount: CGFloat = 10,
        animationDuration: Double = 0.5
    ) -> some View {
        modifier(ShakeOnErrorModifier(
            isError: isError,
            shakeCount: shakeCount,
            shakeAmount: shakeAmount,
            animationDuration: animationDuration
        ))
    }
}

