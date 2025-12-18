//
//  ConditionalViewHelper.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

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

