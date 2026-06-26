//
//  AuthManager.swift
//  Notavil
//
//  Created by Julio Sampaio on 25/06/26.
//

import Foundation

@Observable @MainActor

final class AuthManager{
    private let service: SupabaseAuthServices
    var error: Error?
    var authStatus: AuthState = .notDetermined
    
    init(service: SupabaseAuthServices){
        self.service = service
    }
    
    func login(containsEmail email: String, password: String) async {
        do{
            self.authStatus = try await service.login(containsEmail: email, password: password)
        } catch{
            self.error = error
            print("ERROR: Login service failed: \(error)")
        }
    }
    
    func signUp(containsEmail email: String, password: String) async {
        do{
            self.authStatus = try await service.signUp(containsEmail: email, password: password)
        } catch{
            self.error = error
            print("ERROR: Sign Up service failed: \(error)")
        }
    }
    
    func signOut() async throws{
        do{
            try await service.signOut()
        } catch{
            self.error = error
            print("ERROR: Sign Out service failed: \(error)")
        }
        
    }
    
    func getAuthStatus() async throws{
        self.authStatus = try await service.getAuthStatus()
    }
    
}
