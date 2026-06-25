//
//  LoginView.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        Text("Login")
            .fontWeight(.bold)
        Image(.swift)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .padding()
        VStack{
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
            
            Button{} label: {
                Text("Login")
                    .frame(width: 350, height: 50)
                    .background(Color(.blue))
                    .foregroundColor(Color(.white))
                    .fontWeight(.bold)
                    .cornerRadius(20)
                    
            } .padding(.vertical)
            
            NavigationLink{
                RegisterView()
            } label: {
                Text("Faça seu cadastro aqui")
                    .foregroundColor(Color(.blue))
                
            } .padding(.vertical, 50)

        }
        
    }
}

#Preview {
    NavigationStack{
        LoginView()
    }
   
}
