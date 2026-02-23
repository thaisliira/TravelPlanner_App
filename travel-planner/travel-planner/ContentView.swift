//
//  ContentView.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State var listaviagens: [trip] = Listtrip().allTrips
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($listaviagens) { $viagem in
                    NavigationLink {
                        tripDetails(travel: $viagem)
                    } label: {
                        HStack {
                            Image(viagem.imagem)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            Text(viagem.nomeViagem)
                                .fontWeight(.bold)
                        }
                    }
                }
                .onDelete(perform: removerViagem)
            }
            .navigationTitle("FlyAway")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .destructive) {
                        listaviagens.removeAll()
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func removerViagem(at offsets: IndexSet) {
        listaviagens.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
