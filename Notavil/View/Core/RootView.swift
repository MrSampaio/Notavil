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
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Login deu certo!!!!!!")
                    
                    Button{signOut()} label: {
                        Text("Fazer logout")
                            .frame(width: 350, height: 50)
                            .background(Color(.blue))
                            .foregroundColor(Color(.white))
                            .fontWeight(.bold)
                            .cornerRadius(20)
                        
                    } .padding(.vertical)
                }
                .padding()
            } else if(authManager.authStatus == .notAuthenticated){
                LoginView()
            } else{
                ProgressView()
            }
        }  .task{await authManager.getAuthStatus()}

        
           
        
    }
}

private extension RootView{
    func signOut(){
        Task{
            await authManager.signOut()
        }
    }
}

#Preview {
    RootView()
}
