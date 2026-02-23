//
//  trip.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

struct trip: Codable, Identifiable {
    let id: Int
    var nomeViagem: String
    var destino: String
    var inicio: String
    var fim: String
    var tipoViagem: String
    var imagem: String
}
