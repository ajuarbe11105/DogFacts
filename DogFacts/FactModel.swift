//
//  FactModel.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/15/21.
//

import Foundation

struct FactModel: Identifiable, Codable {
    let id = UUID()
    let fact: String
}
