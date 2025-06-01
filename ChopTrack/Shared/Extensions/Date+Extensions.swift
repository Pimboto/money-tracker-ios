
// Path: /ChopTrack/Shared/Extensions/Date+Extensions.swift

import Foundation

extension Date {
    // MARK: - Formatting
    func formatted(as format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "es_CO")
        return formatter.string(from: self)
    }
    
    var relativeFormat: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "es_CO")
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    // MARK: - Components
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!.addingTimeInterval(-1)
    }
    
    var startOfMonth: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
    
    var endOfMonth: Date {
        Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
    }
    
    // MARK: - Calculations
    func adding(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    func adding(months: Int) -> Date {
        Calendar.current.date(byAdding: .month, value: months, to: self)!
    }
    
    func isInSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}

enum DateFormat: String {
    case full = "EEEE, d 'de' MMMM 'de' yyyy"
    case medium = "d 'de' MMM 'de' yyyy"
    case short = "dd/MM/yyyy"
    case monthYear = "MMMM yyyy"
    case dayMonth = "d 'de' MMMM"
    case time = "HH:mm"
}
