// Path: /ChopTrack/Core/Domain/Entities/Expense.swift

import Foundation
import FirebaseFirestore

struct Expense: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    let amount: Double
    let currency: Currency
    let category: ExpenseCategory
    let description: String
    let date: Date
    let isRecurring: Bool
    var recurringInfo: RecurringInfo?
    let createdAt: Date
    var updatedAt: Date
    
    var formattedAmount: String {
        currency.format(amount)
    }
    
    struct RecurringInfo: Codable, Hashable {
        let frequency: RecurringFrequency
        var nextDate: Date
    }
}

enum RecurringFrequency: String, Codable, CaseIterable {
    case daily = "daily"
    case weekly = "weekly"
    case monthly = "monthly"
    case yearly = "yearly"
    
    var localizedName: String {
        switch self {
        case .daily: return "Diario"
        case .weekly: return "Semanal"
        case .monthly: return "Mensual"
        case .yearly: return "Anual"
        }
    }
}

