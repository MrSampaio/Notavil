//
//  SupabaseDataServices.swift
//  Notavil
//
//  Created by Julio Sampaio on 27/06/26.
//

import Foundation
import Supabase

struct SupabaseDataServices{
    private let client: SupabaseClient

    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: SupabaseConstants.projectURL)!,
            supabaseKey: SupabaseConstants.apiKey)
    }
    
    func fetchUserData() async throws -> UserModel{
        let sessionUser = try await client.auth.session.user
        let uid = sessionUser.id.uuidString
        
        let userData: UserModel = try await client
            .from("users")
            .select()
            .equals("id", value: uid)
            .single()
            .execute()
            .value
        return userData
    }
}

