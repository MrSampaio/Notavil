//
//  ContentView.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import SwiftUI

struct RootView: View {
    @Environment(AuthManager.self) private var authManager

    var body: some View {
        Group{
            if(authManager.authStatus == .authenticated){
                HomeView()
            } else if(authManager.authStatus == .notAuthenticated){
                LoginView()
            } else{
                ProgressView()
            }
        }  .task{await authManager.getAuthStatus()}
            
    }
}

#Preview {
    RootView()
}
