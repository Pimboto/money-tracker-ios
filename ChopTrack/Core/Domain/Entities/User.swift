// Path: /ChopTrack/Core/Domain/Entities/User.swift

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let uid: String
    let email: String
    let displayName: String
    var currency: Currency
    let createdAt: Date
    var updatedAt: Date
    var settings: UserSettings
    
    struct UserSettings: Codable {
        var notifications: NotificationSettings
        var biometricEnabled: Bool
        
        struct NotificationSettings: Codable {
            var billReminders: Bool
            var budgetAlerts: Bool
            var reminderTime: String // Format: "HH:mm"
        }
    }
}

