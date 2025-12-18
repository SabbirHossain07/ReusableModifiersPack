# Reusable Modifiers Pack

<div align="center">

**A grab-bag of common SwiftUI view modifiers for faster UI development**

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

## 📋 Overview

Reusable Modifiers Pack is a collection of commonly used SwiftUI view modifiers that help you build beautiful, interactive UIs faster. Each modifier is production-ready, well-documented, and follows SwiftUI best practices.

## ✨ Features

- **Rounded Card Shadow** - Easy card-like appearance with rounded corners and shadows
- **Pressable Scale** - Smooth scale animations on press interactions
- **Shake On Error** - Visual feedback with shake animations for error states
- **Skeleton Loading** - Beautiful skeleton screens with optional shimmer effects
- **Conditional View Helper** - Clean conditional view rendering

## 🚀 Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Sabbirhossain07/ReusableModifiersPack.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File → Add Packages...
2. Enter the repository URL: `https://github.com/Sabbirhossain07/ReusableModifiersPack.git`
3. Select the version you want to use

### Manual Installation

1. Download or clone this repository
2. Copy the `Utils/Modifiers/` folder to your project
3. Import and use the modifiers

## 📖 Usage

### Rounded Card Shadow

Apply a card-like appearance with rounded corners and shadow:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Content")
                .font(.headline)
                .padding()
        }
        .roundedCardShadow()
    }
}
```

**Customization:**
```swift
.roundedCardShadow(
    cornerRadius: 16,
    shadowRadius: 12,
    shadowColor: .gray,
    shadowOpacity: 0.2,
    backgroundColor: .blue
)
```

### Pressable Scale

Add interactive scale animation when pressed:

```swift
Button(action: {
    // Your action
}) {
    Text("Press Me")
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
}
.pressableScale()
```

**Customization:**
```swift
.pressableScale(
    scale: 0.9,  // Scale factor when pressed
    animation: .spring(response: 0.3, dampingFraction: 0.6)
)
```

### Shake On Error

Provide visual feedback when errors occur:

```swift
struct LoginView: View {
    @State private var showError = false
    @State private var password = ""
    
    var body: some View {
        SecureField("Password", text: $password)
            .shakeOnError(isError: $showError)
    }
}
```

**Trigger shake:**
```swift
showError = true
// Reset after animation
DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
    showError = false
}
```

**Customization:**
```swift
.shakeOnError(
    isError: $showError,
    shakeCount: 4,
    shakeAmount: 10,
    animationDuration: 0.5
)
```

### Skeleton Loading

Display beautiful skeleton loading states:

```swift
struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        Text("Loading content...")
            .skeleton(isLoading: isLoading)
    }
}
```

**Customization:**
```swift
.skeleton(
    isLoading: isLoading,
    cornerRadius: 12,
    shimmer: true,
    shimmerColor: Color.white.opacity(0.6)
)
```

### Conditional View Helper

Clean conditional view rendering:

```swift
// Using ConditionalView
ConditionalView(if: isLoggedIn) {
    Text("Welcome!")
} else: {
    Text("Please login")
}

// Using if modifier
Text("Hello")
    .if(isBold) { $0.bold() }
    .if(!isBold) { $0.italic() }

// With else clause
Text("Hello")
    .if(isBold, then: { $0.bold() }, else: { $0.italic() })
```

## 📁 Project Structure

```
ReusableModifiersPack/
├── Utils/
│   └── Modifiers/
│       ├── RoundedCardShadow.swift
│       ├── PressableScale.swift
│       ├── ShakeOnError.swift
│       ├── SkeletonAnyView.swift
│       ├── ConditionalViewHelper.swift
│       └── Modifiers.swift
├── ContentView.swift (Demo)
└── README.md
```

## 🎯 Requirements

- iOS 15.0+ / macOS 12.0+ / watchOS 8.0+ / tvOS 15.0+
- Swift 5.0+
- Xcode 13.0+

## 🔧 Example

Check out `ContentView.swift` in the project for comprehensive examples of all modifiers in action.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Sabbir Hossain**

- GitHub: [@Sabbirhossain07](https://github.com/Sabbirhossain07)

## 🙏 Acknowledgments

- Inspired by the need for reusable SwiftUI modifiers in everyday development
- Built with ❤️ using SwiftUI

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ by [Sabbir Hossain](https://github.com/Sabbirhossain07)

⭐ Star this repo if you find it helpful!

</div>

