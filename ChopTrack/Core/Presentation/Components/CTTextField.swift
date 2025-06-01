// Path: /ChopTrack/Core/Presentation/Components/CTTextField.swift

import SwiftUI

struct CTTextField: View {
    let title: String
    @Binding var text: String
    var placeholder: String = ""
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var icon: String? = nil
    
    @FocusState private var isFocused: Bool
    @State private var showPassword = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.xs) {
            if !title.isEmpty {
                Text(title)
                    .font(.ctCaption)
                    .foregroundColor(.ctTextSecondary)
            }
            
            HStack(spacing: Spacing.sm) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(.ctTextSecondary)
                }
                
                Group {
                    if isSecure && !showPassword {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                            .keyboardType(keyboardType)
                    }
                }
                .font(.ctBody)
                .foregroundColor(.ctTextPrimary)
                .focused($isFocused)
                
                if isSecure {
                    Button(action: { showPassword.toggle() }) {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.ctTextSecondary)
                    }
                }
            }
            .padding(Spacing.md)
            .background(Color.ctSurface)
            .cornerRadius(Radius.md)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.md)
                    .stroke(isFocused ? Color.ctPrimary : Color.clear, lineWidth: 2)
            )
        }
    }
}
