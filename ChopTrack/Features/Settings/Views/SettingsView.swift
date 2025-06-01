// Path: /ChopTrack/Features/Settings/Views/SettingsView.swift

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ctBackground
                    .ignoresSafeArea()
                
                Text("Configuración")
                    .font(.ctTitle)
                    .foregroundColor(.ctTextPrimary)
            }
            .navigationTitle("Ajustes")
        }
    }
}
