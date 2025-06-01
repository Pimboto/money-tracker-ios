// Path: /ChopTrack/Features/Dashboard/Views/DashboardView.swift

import SwiftUI

struct DashboardView: View {
    @State private var currentMood: EmotionalFace.Mood = .happy
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Spacing.lg) {
                    // Header
                    HStack {
                        VStack(alignment: .leading, spacing: Spacing.xs) {
                            Text("Hola, Usuario 👋")
                                .font(.ctTitle)
                                .foregroundColor(.ctTextPrimary)
                            
                            Text("¿Cómo están tus finanzas hoy?")
                                .font(.ctBody)
                                .foregroundColor(.ctTextSecondary)
                        }
                        
                        Spacer()
                        
                        EmotionalFace(mood: currentMood, size: 60)
                    }
                    .padding(.horizontal, Spacing.lg)
                    
                    // Balance Card
                    CTCard {
                        VStack(spacing: Spacing.md) {
                            Text("Balance del mes")
                                .font(.ctCaption)
                                .foregroundColor(.ctTextSecondary)
                            
                            Text("$1,234.56")
                                .font(.ctLargeTitle)
                                .foregroundColor(.ctPrimary)
                            
                            HStack {
                                Label("Ingresos: $2,000", systemImage: "arrow.up.circle.fill")
                                    .font(.ctCaption)
                                    .foregroundColor(.ctSuccess)
                                
                                Spacer()
                                
                                Label("Gastos: $765.44", systemImage: "arrow.down.circle.fill")
                                    .font(.ctCaption)
                                    .foregroundColor(.ctError)
                            }
                        }
                    }
                    .padding(.horizontal, Spacing.lg)
                    
                    // Quick Actions
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        Text("Acciones rápidas")
                            .font(.ctHeadline)
                            .foregroundColor(.ctTextPrimary)
                            .padding(.horizontal, Spacing.lg)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: Spacing.md) {
                                QuickActionCard(title: "Agregar Gasto", icon: "plus.circle.fill", color: .ctPrimary)
                                QuickActionCard(title: "Ver Reportes", icon: "chart.pie.fill", color: .ctSecondary)
                                QuickActionCard(title: "Presupuestos", icon: "dollarsign.circle.fill", color: .ctAccent)
                            }
                            .padding(.horizontal, Spacing.lg)
                        }
                    }
                    
                    // Recent Expenses Preview
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        HStack {
                            Text("Gastos recientes")
                                .font(.ctHeadline)
                                .foregroundColor(.ctTextPrimary)
                            
                            Spacer()
                            
                            Button("Ver todos") {
                                // TODO: Navigate to expenses
                            }
                            .font(.ctCaption)
                            .foregroundColor(.ctPrimary)
                        }
                        .padding(.horizontal, Spacing.lg)
                        
                        // Placeholder expenses
                        VStack(spacing: Spacing.sm) {
                            ExpenseRowPlaceholder(category: .food, description: "Almuerzo", amount: "$12.50")
                            ExpenseRowPlaceholder(category: .transport, description: "Uber", amount: "$8.30")
                            ExpenseRowPlaceholder(category: .shopping, description: "Supermercado", amount: "$45.80")
                        }
                        .padding(.horizontal, Spacing.lg)
                    }
                }
                .padding(.vertical, Spacing.lg)
            }
            .background(Color.ctBackground)
            .navigationBarHidden(true)
        }
    }
}

struct QuickActionCard: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: Spacing.sm) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
            
            Text(title)
                .font(.ctCaption)
                .foregroundColor(.ctTextPrimary)
        }
        .frame(width: 100, height: 100)
        .background(Color.ctSurface)
        .cornerRadius(Radius.lg)
    }
}

struct ExpenseRowPlaceholder: View {
    let category: ExpenseCategory
    let description: String
    let amount: String
    
    var body: some View {
        HStack(spacing: Spacing.md) {
            Text(category.emoji)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(description)
                    .font(.ctBody)
                    .foregroundColor(.ctTextPrimary)
                
                Text(category.localizedName)
                    .font(.ctCaption)
                    .foregroundColor(.ctTextSecondary)
            }
            
            Spacer()
            
            Text(amount)
                .font(.ctHeadline)
                .foregroundColor(.ctError)
        }
        .padding(Spacing.md)
        .background(Color.ctSurface)
        .cornerRadius(Radius.md)
    }
}
