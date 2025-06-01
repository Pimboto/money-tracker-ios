// Path: /ChopTrack/App/ContentView.swift

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var showSplash = true
    
    var body: some View {
        Text ("Hello World")
        Group {
            if showSplash {
                SplashView()
                    .transition(.opacity)
            } else if authManager.isAuthenticated {
                MainTabView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    ))
            } else {
                AuthenticationView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)
                    ))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: authManager.isAuthenticated)
        .onAppear {
            // Mostrar splash por 2 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

// MARK: - Splash View
struct SplashView: View {
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Color.ctBackground
                .ignoresSafeArea()
            
            VStack(spacing: Spacing.lg) {
                // Logo con cara emotiva
                EmotionalFace(mood: .happy, size: 120)
                    .scaleEffect(scale)
                    .opacity(opacity)
                
                Text("ChopTrack")
                    .font(.ctLargeTitle)
                    .foregroundColor(.ctTextPrimary)
                    .opacity(opacity)
                
                Text("Tu control financiero")
                    .font(.ctCaption)
                    .foregroundColor(.ctTextSecondary)
                    .opacity(opacity * 0.8)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

// MARK: - Main Tab View
struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
                .tag(0)
            
            ExpenseListView()
                .tabItem {
                    Label("Gastos", systemImage: "creditcard.fill")
                }
                .tag(1)
            
            BudgetListView()
                .tabItem {
                    Label("Presupuestos", systemImage: "chart.pie.fill")
                }
                .tag(2)
            
            ReportsView()
                .tabItem {
                    Label("Reportes", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
        .accentColor(.ctPrimary)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .environmentObject(AuthManager())
        .environmentObject(NavigationManager())
}
