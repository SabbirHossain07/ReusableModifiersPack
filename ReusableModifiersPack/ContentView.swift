//
//  ContentView.swift
//  ReusableModifiersPack
//
//  Created by Sabbir Hossain
//

import SwiftUI

struct ContentView: View {
    @State private var showError = false
    @State private var isLoading = true
    @State private var isBold = false
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Header
                    headerSection
                    
                    // Rounded Card Shadow Demo
                    roundedCardShadowDemo
                    
                    // Pressable Scale Demo
                    pressableScaleDemo
                    
                    // Shake On Error Demo
                    shakeOnErrorDemo
                    
                    // Skeleton Loading Demo
                    skeletonLoadingDemo
                    
                    // Conditional View Demo
                    conditionalViewDemo
                }
                .padding()
            }
            .navigationTitle("Modifiers Pack")
        }
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("Reusable Modifiers Pack")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Grab-bag of common view modifiers for faster UI")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top)
    }
    
    // MARK: - Rounded Card Shadow Demo
    
    private var roundedCardShadowDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Rounded Card Shadow")
                .font(.headline)
            
            VStack(spacing: 16) {
                Text("Card Content")
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .roundedCardShadow()
                
                Text("Custom Card")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .roundedCardShadow(
                        cornerRadius: 20,
                        shadowRadius: 12,
                        backgroundColor: .blue
                    )
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Pressable Scale Demo
    
    private var pressableScaleDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pressable Scale")
                .font(.headline)
            
            HStack(spacing: 20) {
                Button(action: {}) {
                    Text("Press Me")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .pressableScale()
                
                Button(action: {}) {
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                .pressableScale(scale: 0.9)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Shake On Error Demo
    
    private var shakeOnErrorDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Shake On Error")
                .font(.headline)
            
            VStack(spacing: 16) {
                TextField("Enter email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .shakeOnError(isError: $showError)
                
                Button(action: {
                    if email.isEmpty || !email.contains("@") {
                        showError = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            showError = false
                        }
                    }
                }) {
                    Text("Validate Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Skeleton Loading Demo
    
    private var skeletonLoadingDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Skeleton Loading")
                .font(.headline)
            
            VStack(spacing: 12) {
                // Skeleton text
                Text("Loading content...")
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .skeleton(isLoading: isLoading)
                
                // Skeleton card
                VStack(alignment: .leading, spacing: 8) {
                    Text("Card Title")
                        .font(.headline)
                    Text("Card Description")
                        .font(.subheadline)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .skeleton(isLoading: isLoading, cornerRadius: 12)
                
                Button(action: {
                    withAnimation {
                        isLoading.toggle()
                    }
                }) {
                    Text(isLoading ? "Show Content" : "Show Skeleton")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Conditional View Demo
    
    private var conditionalViewDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Conditional View Helper")
                .font(.headline)
            
            VStack(spacing: 16) {
                // Using ConditionalView
                ConditionalView(if: isBold) {
                    Text("This text is BOLD")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.blue)
                } else: {
                    Text("This text is NORMAL")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                // Using if modifier
                Text("Dynamic Text")
                    .font(.title2)
                    .if(isBold) { $0.bold().foregroundColor(.blue) }
                    .if(!isBold) { $0.foregroundColor(.gray) }
                
                Toggle("Toggle Bold", isOn: $isBold)
                    .toggleStyle(.switch)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
