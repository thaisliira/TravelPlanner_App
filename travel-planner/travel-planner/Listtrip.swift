//
//  Untitled.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

class Listtrip:  Decodable {
    
    var allTrips: [trip] = []
    
    init (){
        decodeJSONData()
    }
        func decodeJSONData(){
            if let url = Bundle.main.url(forResource: "trips", withExtension: "json") {
                   do {
                       let data = try Data(contentsOf: url)
                       let decoder = JSONDecoder()
                       decoder.keyDecodingStrategy = .convertFromSnakeCase
                       allTrips = try decoder.decode([trip].self, from: data)
                       print(allTrips.count)
                   } catch {
                       print("Error decoding JSON: \(error)")
                   }
               }
        }
}
