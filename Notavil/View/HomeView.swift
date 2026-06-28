//
//  HomeView.swift
//  Notavil
//
//  Created by Julio Sampaio on 27/06/26.
//

import Foundation
import SwiftUI

struct HomeView: View{
    @Environment(AuthManager.self) private var authManager
    @Environment(SupabaseDataManager.self) private var dataManager
    
    var body: some View{
        VStack {
            if let userData = dataManager.currentUser{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Bem-vindo(a) \(userData.firstName)!")
                Text("Seu email é \(userData.email)")
                
                Button{signOut()} label: {
                    Text("\(userData.firstName), deseja fazer logout?")
                        .frame(width: 350, height: 50)
                        .background(Color(.blue))
                        .foregroundColor(Color(.white))
                        .fontWeight(.bold)
                        .cornerRadius(20)
                    
                } .padding(.vertical)
            } else{
                ProgressView("Carregando perfil...")
                Button("Forçar Logout (Dev)") {
                                        signOut()
                                    }
                                    .foregroundColor(.red)
               
            }
            
        } .task {
            await dataManager.fetchUserData()
            
            
        }
        .padding()

    }
}

private extension HomeView{
    func signOut(){
        Task{
            await authManager.signOut()
        }
    }
}
