//
//  tripDetails.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct tripDetails: View {
    @Binding var travel: trip
    @State private var isEditing = false
    
    let types = ["Lazer", "Trabalho", "Família", "Aventura", "Cultural"]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    Image(travel.imagem)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                        .clipped()
                    
                    
                    Text(travel.tipoViagem)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }

                VStack(spacing: 8) {
                    Text(travel.nomeViagem)
                        .font(.title2)
                        .fontWeight(.bold)

                    Divider()

                    VStack(alignment: .leading, spacing: 10) {
                        Label("Destino: \(travel.destino)", systemImage: "mappin.and.ellipse")
                        Label("Início: \(travel.inicio)", systemImage: "calendar")
                        Label("Fim: \(travel.fim)", systemImage: "calendar.badge.clock")
                    }
                    .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        .toolbar {
            // Botão para abrir a edição
            Button {
                isEditing = true
            } label: {
                Image(systemName: "pencil.circle.fill") 
                    .font(.title3)
            }
        }
        // Janela de Edição
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                Form {
                    Section("Editar Informações") {
                        TextField("Nome da Viagem", text: $travel.nomeViagem)
                        TextField("Destino", text: $travel.destino)
                        
                        // Seleção do tipo a partir de lista pré-definida
                        Picker("Tipo de Viagem", selection: $travel.tipoViagem) {
                            ForEach(types, id: \.self) { tipo in
                                Text(tipo)
                            }
                        }
                    }
                    
                    Section("Datas") {
                        TextField("Início", text: $travel.inicio)
                        TextField("Fim", text: $travel.fim)
                    }
                }
                .navigationTitle("Editar Viagem")
                .toolbar {
                    Button("Concluído") { isEditing = false }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        tripDetails(travel: .constant(Listtrip().allTrips[0]))
    }
}
