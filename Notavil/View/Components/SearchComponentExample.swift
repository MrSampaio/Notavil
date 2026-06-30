//
//  SearchComponent.swift
//  Notavil
//
//  Created by Julio Sampaio on 29/06/26.
//

import Foundation
import SwiftUI

struct SearchComponentExample: View{
    @State private var textoDaBusca = ""
        
        let todosOsContatos = ["Julio", "Ana", "Carlos", "Beatriz", "João"]
        
        var contatosFiltrados: [String] {
            if textoDaBusca.isEmpty {
                return todosOsContatos
            } else {
                return todosOsContatos.filter { contato in
                    contato.localizedCaseInsensitiveContains(textoDaBusca)
                }
            }
        }
        
        var body: some View {
            NavigationStack {
                List(contatosFiltrados, id: \.self) { contato in
                    Text(contato)
                }
                .navigationTitle("Contatos")

                .searchable(text: $textoDaBusca, prompt: "Buscar contato...")
            }
        }
}

#Preview {
    SearchComponentExample()
}
