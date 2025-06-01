
// Path: /ChopTrack/Features/Expenses/Views/ExpenseListView.swift

import SwiftUI

struct ExpenseListView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ctBackground
                    .ignoresSafeArea()
                
                Text("Lista de Gastos")
                    .font(.ctTitle)
                    .foregroundColor(.ctTextPrimary)
            }
            .navigationTitle("Gastos")
        }
    }
}
