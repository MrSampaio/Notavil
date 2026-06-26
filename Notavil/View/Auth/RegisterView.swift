//
//  RegisterView.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import Foundation
import SwiftUI

struct RegisterView: View{
    @Environment(AuthManager.self) private var authManager
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Cadastro")
                    .fontWeight(.bold)
                Image(.swift)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack{
                    TextField("Nome", text: $firstName)
                        .autocapitalization(.none)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundColor(Color(.black))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    TextField("Sobrenome", text: $lastName)
                        .autocapitalization(.none)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundColor(Color(.black))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundColor(Color(.black))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    SecureField("Senha", text: $password)
                        .autocapitalization(.none)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundColor(Color(.white))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    Button{signUp()} label: {
                        Text("Cadastrar")
                            .frame(width: 350, height: 50)
                            .background(Color(.blue))
                            .foregroundColor(Color(.white))
                            .fontWeight(.bold)
                            .cornerRadius(20)
                        
                    } .padding(.vertical)
                    
                    NavigationLink{
                        LoginView()
                    } label: {
                        Text("Faça seu login aqui")
                            .foregroundColor(Color(.blue))
                        
                    } .padding(.vertical, 50)
                    
                }
                
            }
        }
    }
}

private extension RegisterView{
    func signUp(){
        Task{
            await authManager.signUp(containsEmail: email, password: password)
        }
        
    }
}

    
#Preview {
    NavigationStack{
        RegisterView()
    }
    
}
