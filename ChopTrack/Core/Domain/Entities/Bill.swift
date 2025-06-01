
// Path: /ChopTrack/Core/Domain/Entities/Bill.swift

import Foundation
import FirebaseFirestore

struct Bill: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let amount: Double
    let currency: Currency
    var dueDate: Date
    let category: ExpenseCategory
    let isRecurring: Bool
    var frequency: RecurringFrequency?
    var isPaid: Bool
    let remindBefore: Int // días antes
    let createdAt: Date
    var updatedAt: Date
    
    var daysUntilDue: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: dueDate).day ?? 0
    }
    
    var isOverdue: Bool {
        !isPaid && dueDate < Date()
    }
    
    var shouldRemind: Bool {
        !isPaid && daysUntilDue <= remindBefore
    }
}
