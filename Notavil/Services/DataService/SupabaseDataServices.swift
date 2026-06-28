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
    
    func fetchUserData(UID: Int) async throws{
        
    }
}

