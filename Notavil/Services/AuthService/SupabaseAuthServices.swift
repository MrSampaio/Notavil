//
//  AuthServices.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import Foundation
import Supabase

struct SupabaseAuthServices{
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: SupabaseConstants.projectURL)!,
            supabaseKey: SupabaseConstants.apiKey)
    }
    
    func login(containsEmail email: String, password: String) async throws -> AuthState{
        try await client.auth.signIn(email: email, password: password)
        return .authenticated
    }
    
    func signUp(containsEmail email: String, password: String, firstName: String, lastName: String) async throws -> AuthState{
        
        let userMetaData: [String: AnyJSON] = [
            "first_name": .string(firstName),
            "last_name": .string(lastName)
        ]
        
        try await client.auth.signUp(
            email: email,
            password: password,
            data: userMetaData
        )
        
        return .authenticated
    }
    
    func signOut() async throws{
        try await client.auth.signOut()
    }
    
    func getAuthStatus() async throws -> AuthState{
        let session = try? await client.auth.session.user
        return session == nil ? .notAuthenticated : .authenticated
    }
}
