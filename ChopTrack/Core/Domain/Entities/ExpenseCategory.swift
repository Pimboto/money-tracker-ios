// Path: /ChopTrack/Core/Domain/Entities/ExpenseCategory.swift

import Foundation
import SwiftUI

enum ExpenseCategory: String, Codable, CaseIterable {
    case food = "food"
    case transport = "transport"
    case entertainment = "entertainment"
    case bills = "bills"
    case shopping = "shopping"
    case health = "health"
    case education = "education"
    case other = "other"
    
    var icon: String {
        switch self {
        case .food: return "fork.knife"
        case .transport: return "car.fill"
        case .entertainment: return "gamecontroller.fill"
        case .bills: return "doc.text.fill"
        case .shopping: return "bag.fill"
        case .health: return "heart.fill"
        case .education: return "book.fill"
        case .other: return "square.grid.2x2.fill"
        }
    }
    
    var emoji: String {
        switch self {
        case .food: return "🍔"
        case .transport: return "🚗"
        case .entertainment: return "🎮"
        case .bills: return "📄"
        case .shopping: return "🛍️"
        case .health: return "🏥"
        case .education: return "📚"
        case .other: return "📦"
        }
    }
    
    var localizedName: String {
        switch self {
        case .food: return "Comida"
        case .transport: return "Transporte"
        case .entertainment: return "Entretenimiento"
        case .bills: return "Facturas"
        case .shopping: return "Compras"
        case .health: return "Salud"
        case .education: return "Educación"
        case .other: return "Otros"
        }
    }
    
    var color: Color {
        switch self {
        case .food: return .orange
        case .transport: return .blue
        case .entertainment: return .purple
        case .bills: return .red
        case .shopping: return .pink
        case .health: return .green
        case .education: return .yellow
        case .other: return .gray
        }
    }
}
