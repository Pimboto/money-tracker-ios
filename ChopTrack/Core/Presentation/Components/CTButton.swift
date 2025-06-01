// Path: /ChopTrack/Core/Presentation/Components/CTButton.swift

import SwiftUI

struct CTButton: View {
    enum Style {
        case primary
        case secondary
        case tertiary
        case destructive
        
        var backgroundColor: Color {
            switch self {
            case .primary: return .ctPrimary
            case .secondary: return .ctSurface
            case .tertiary: return .clear
            case .destructive: return .ctError
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .primary: return .ctBackground
            case .secondary: return .ctTextPrimary
            case .tertiary: return .ctPrimary
            case .destructive: return .white
            }
        }
    }
    
    let title: String
    let style: Style
    let isLoading: Bool
    let action: () -> Void
    
    init(
        _ title: String,
        style: Style = .primary,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.isLoading = isLoading
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            HapticManager.shared.impact(.light)
            action()
        }) {
            HStack(spacing: Spacing.xs) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: style.foregroundColor))
                        .scaleEffect(0.8)
                }
                
                Text(title)
                    .font(.ctHeadline)
                    .foregroundColor(style.foregroundColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(style.backgroundColor)
            .cornerRadius(Radius.lg)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg)
                    .stroke(style == .tertiary ? style.foregroundColor : Color.clear, lineWidth: 2)
            )
        }
        .disabled(isLoading)
        .opacity(isLoading ? 0.7 : 1)
    }
}
