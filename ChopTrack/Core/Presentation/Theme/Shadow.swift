

// Path: /ChopTrack/Core/Presentation/Theme/Shadow.swift

import SwiftUI

extension View {
    func ctShadow(_ style: ShadowStyle = .medium) -> some View {
        self.modifier(CTShadowModifier(style: style))
    }
}

enum ShadowStyle {
    case light
    case medium
    case heavy
    
    var color: Color {
        Color.black.opacity(opacity)
    }
    
    var radius: CGFloat {
        switch self {
        case .light: return 4
        case .medium: return 8
        case .heavy: return 16
        }
    }
    
    var opacity: Double {
        switch self {
        case .light: return 0.1
        case .medium: return 0.2
        case .heavy: return 0.3
        }
    }
    
    var offset: CGSize {
        switch self {
        case .light: return CGSize(width: 0, height: 2)
        case .medium: return CGSize(width: 0, height: 4)
        case .heavy: return CGSize(width: 0, height: 8)
        }
    }
}

struct CTShadowModifier: ViewModifier {
    let style: ShadowStyle
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: style.color,
                radius: style.radius,
                x: style.offset.width,
                y: style.offset.height
            )
    }
}
