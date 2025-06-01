
// Path: /ChopTrack/Core/Domain/Entities/Currency.swift

import Foundation
import SwiftUI

enum Currency: String, Codable, CaseIterable {
    case USD = "USD"
    case COP = "COP"
    
    var symbol: String {
        switch self {
        case .USD: return "$"
        case .COP: return "$"
        }
    }
    
    var name: String {
        switch self {
        case .USD: return "Dólar estadounidense"
        case .COP: return "Peso colombiano"
        }
    }
    
    var locale: Locale {
        switch self {
        case .USD: return Locale(identifier: "en_US")
        case .COP: return Locale(identifier: "es_CO")
        }
    }
    
    func format(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.maximumFractionDigits = self == .COP ? 0 : 2
        return formatter.string(from: NSNumber(value: amount)) ?? "\(symbol)\(amount)"
    }
}
