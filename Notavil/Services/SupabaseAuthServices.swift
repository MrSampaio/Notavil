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
    
    init(client: SupabaseClient) {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: SupabaseConstants.projectURL)!,
            supabaseKey: SupabaseConstants.apiKey)
    }
    
    func login(containsEmail email: String, password: String) async throws{
        try await client.auth.signIn(email: email, password: password)
    }
    
    func signUp(containsEmail email: String, password: String) async throws{
        try await client.auth.signUp(email: email, password: password)
    }
    
    func signOut() async throws{
        try await client.auth.signOut()
    }
    
    func getAuthStatus() async throws{
        
    }
}
