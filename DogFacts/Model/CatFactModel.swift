//
//  CatFactModel.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/16/21.
//

import SwiftUI


struct CatFactModel: Identifiable, Codable {
    let id: String?
    let fact: String
    let length: Int
}
