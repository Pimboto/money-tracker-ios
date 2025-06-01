// Path: /ChopTrack/Core/Managers/AuthManager.swift

import SwiftUI
import Firebase
import FirebaseAuth
import Combine

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let auth = Auth.auth()
    
    init() {
        setupAuthStateListener()
    }
    
    private func setupAuthStateListener() {
        auth.addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isAuthenticated = user != nil
                if let user = user {
                    self?.fetchUserData(uid: user.uid)
                } else {
                    self?.currentUser = nil
                }
            }
        }
    }
    
    private func fetchUserData(uid: String) {
        // Implementar fetch de datos del usuario desde Firestore
    }
    
    func signIn(email: String, password: String) async throws {
        isLoading = true
        errorMessage = nil
        
        do {
            try await auth.signIn(withEmail: email, password: password)
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            throw error
        }
    }
    
    func signUp(email: String, password: String, displayName: String) async throws {
        isLoading = true
        errorMessage = nil
        
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            
            // Actualizar perfil
            let changeRequest = result.user.createProfileChangeRequest()
            changeRequest.displayName = displayName
            try await changeRequest.commitChanges()
            
            // Crear documento en Firestore
            try await createUserDocument(uid: result.user.uid, email: email, displayName: displayName)
            
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            throw error
        }
    }
    
    private func createUserDocument(uid: String, email: String, displayName: String) async throws {
        let db = Firestore.firestore()
        let userData: [String: Any] = [
            "uid": uid,
            "email": email,
            "displayName": displayName,
            "currency": Currency.USD.rawValue,
            "createdAt": FieldValue.serverTimestamp(),
            "updatedAt": FieldValue.serverTimestamp(),
            "settings": [
                "notifications": [
                    "billReminders": true,
                    "budgetAlerts": true,
                    "reminderTime": "09:00"
                ],
                "biometricEnabled": false
            ]
        ]
        
        try await db.collection("users").document(uid).setData(userData)
    }
    
    func signOut() throws {
        try auth.signOut()
    }
}


