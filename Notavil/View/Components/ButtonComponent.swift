//
//  ButtonComponent.swift
//  Notavil
//
//  Created by Julio Sampaio on 29/06/26.
//

import Foundation
import SwiftUI

struct ButtonComponent: View {
    public let title: String
    
    var body: some View {
        Button {
           
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.title2)
                .foregroundColor(.font)
                .padding(10)
        }
        
        .frame(maxWidth: .infinity)
        .background(Color(.button))
        .cornerRadius(40)
        .buttonStyle(.glass)
        .padding(0)
    }
}

#Preview {
    ButtonComponent(title: "Botão")
}
