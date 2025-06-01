
// Path: /ChopTrack/Core/Domain/Entities/Budget.swift

import Foundation
import FirebaseFirestore

struct Budget: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let amount: Double
    let currency: Currency
    let period: BudgetPeriod
    let category: ExpenseCategory?
    var spent: Double
    let startDate: Date
    let endDate: Date
    let alertThreshold: Int // Porcentaje (0-100)
    let createdAt: Date
    var updatedAt: Date
    
    var progress: Double {
        guard amount > 0 else { return 0 }
        return min(spent / amount, 1.0)
    }
    
    var remaining: Double {
        max(amount - spent, 0)
    }
    
    var isOverBudget: Bool {
        spent > amount
    }
    
    var shouldAlert: Bool {
        progress >= Double(alertThreshold) / 100.0
    }
}

enum BudgetPeriod: String, Codable, CaseIterable {
    case weekly = "weekly"
    case monthly = "monthly"
    case yearly = "yearly"
    
    var localizedName: String {
        switch self {
        case .weekly: return "Semanal"
        case .monthly: return "Mensual"
        case .yearly: return "Anual"
        }
    }
}
