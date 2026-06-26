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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    RootView()
}
