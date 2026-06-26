//
//  NotavilApp.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import SwiftUI
import Supabase

@main
struct NotavilApp: App {
    @State private var authManager = AuthManager(service: SupabaseAuthServices())
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(authManager)
        }
    }
}
