//
//  ConditionalViewHelper.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

/// A utility view that conditionally displays one of two views based on a boolean condition.
///
/// Example usage:
/// ```swift
/// ConditionalView(if: isLoggedIn) {
///     Text("Welcome!")
/// } else: {
///     Text("Please login")
/// }
/// ```
public struct ConditionalView<TrueContent: View, FalseContent: View>: View {
    let condition: Bool
    let trueContent: () -> TrueContent
    let falseContent: () -> FalseContent
    
    public init(
        `if` condition: Bool,
        @ViewBuilder then trueContent: @escaping () -> TrueContent,
        @ViewBuilder else falseContent: @escaping () -> FalseContent
    ) {
        self.condition = condition
        self.trueContent = trueContent
        self.falseContent = falseContent
    }
    
    public var body: some View {
        if condition {
            trueContent()
        } else {
            falseContent()
        }
    }
}

/// A utility view that conditionally displays a view based on a boolean condition.
///
/// Example usage:
/// ```swift
/// ConditionalView(if: shouldShow) {
///     Text("Visible")
/// }
/// ```
public struct ConditionalViewOptional<Content: View>: View {
    let condition: Bool
    let content: () -> Content
    
    public init(
        `if` condition: Bool,
        @ViewBuilder then content: @escaping () -> Content
    ) {
        self.condition = condition
        self.content = content
    }
    
    public var body: some View {
        if condition {
            content()
        }
    }
}

// MARK: - View Extensions

extension View {
    /// Conditionally applies a view modifier based on a boolean condition.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello")
    ///     .if(isBold) { $0.bold() }
    /// ```
    @ViewBuilder
    public func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Conditionally applies one of two view modifiers based on a boolean condition.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Hello")
    ///     .if(isBold, then: { $0.bold() }, else: { $0.italic() })
    /// ```
    @ViewBuilder
    public func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        then trueTransform: (Self) -> TrueContent,
        else falseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition {
            trueTransform(self)
        } else {
            falseTransform(self)
        }
    }
}

