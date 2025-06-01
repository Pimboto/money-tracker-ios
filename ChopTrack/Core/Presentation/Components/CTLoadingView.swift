// Path: /ChopTrack/Core/Presentation/Components/CTLoadingView.swift

import SwiftUI

struct CTLoadingView: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.ctBackground.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: Spacing.lg) {
                EmotionalFace(mood: .happy, size: 80)
                    .rotationEffect(.degrees(rotation))
                    .animation(
                        .linear(duration: 2)
                        .repeatForever(autoreverses: false),
                        value: rotation
                    )
                
                Text("Cargando...")
                    .font(.ctHeadline)
                    .foregroundColor(.ctTextPrimary)
            }
            .padding(Spacing.xl)
            .background(Color.ctSurface)
            .cornerRadius(Radius.xl)
            .ctShadow(.heavy)
        }
        .onAppear {
            rotation = 360
        }
    }
}
