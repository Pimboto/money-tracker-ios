
// Path: /ChopTrack/Core/Managers/NavigationManager.swift

import SwiftUI
import Combine

enum AppRoute: Hashable {
    case auth
    case dashboard
    case expenses
    case addExpense(expense: Expense? = nil)
    case expenseDetail(expense: Expense)
    case budgets
    case addBudget
    case reports
    case settings
    case profile
}

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    @Published var tabSelection = 0
    @Published var showingSheet: AppRoute?
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func showSheet(_ route: AppRoute) {
        showingSheet = route
    }
    
    func dismissSheet() {
        showingSheet = nil
    }
}
