//
//  DogImageModel.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/16/21.
//

import SwiftUI


struct DogImageModel: Identifiable, Codable {
    var id = UUID()
    let message: String
    let status: String
}
