// Path: /ChopTrack/Features/Auth/Views/AuthenticationView.swift

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ctBackground
                    .ignoresSafeArea()
                
                VStack(spacing: Spacing.xl) {
                    // Logo
                    EmotionalFace(mood: .happy, size: 100)
                        .padding(.top, Spacing.xxl)
                    
                    Text("ChopTrack")
                        .font(.ctLargeTitle)
                        .foregroundColor(.ctTextPrimary)
                    
                    Text("Tu control financiero personal")
                        .font(.ctBody)
                        .foregroundColor(.ctTextSecondary)
                    
                    Spacer()
                    
                    // Botones temporales
                    VStack(spacing: Spacing.md) {
                        CTButton("Iniciar Sesión", style: .primary) {
                            // TODO: Navegar a login
                        }
                        
                        CTButton("Crear Cuenta", style: .secondary) {
                            // TODO: Navegar a signup
                        }
                    }
                    .padding(.horizontal, Spacing.lg)
                    .padding(.bottom, Spacing.xxl)
                }
            }
        }
    }
}






