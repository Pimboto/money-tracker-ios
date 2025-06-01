// Path: /ChopTrack/Features/Reports/Views/ReportsView.swift

import SwiftUI

struct ReportsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ctBackground
                    .ignoresSafeArea()
                
                Text("Reportes")
                    .font(.ctTitle)
                    .foregroundColor(.ctTextPrimary)
            }
            .navigationTitle("Reportes")
        }
    }
}
