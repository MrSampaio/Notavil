//
//  DirectoryComponent.swift
//  Notavil
//
//  Created by Julio Sampaio on 29/06/26.
//

import Foundation
import SwiftUI

struct DirectoryComponent: View {
    let icon: String
    let directoryTitle: String
    let totalElements: String
    
    var body: some View {
        Button {
           
        } label: {
            HStack(alignment: .center, spacing: 15) {
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.button)
                    .fontWeight(.light)
                
                Text(directoryTitle)
                    .foregroundColor(Color(.font))
                    .fontWeight(.light)
                    .font(.title2)
                
                Spacer()
                
                Text(totalElements)
                    .foregroundColor(.font)
                    .opacity(0.8)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.icons))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color(.directory))
        .cornerRadius(40)
        .buttonStyle(.glass)
    }
}
#Preview {
    DirectoryComponent(icon: "folder.circle.fill", directoryTitle: "Título", totalElements: "10")
}
