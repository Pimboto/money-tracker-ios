// Path: /ChopTrack/Features/Budgets/Views/BudgetListView.swift

import SwiftUI

struct BudgetListView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ctBackground
                    .ignoresSafeArea()
                
                Text("Presupuestos")
                    .font(.ctTitle)
                    .foregroundColor(.ctTextPrimary)
            }
            .navigationTitle("Presupuestos")
        }
    }
}
