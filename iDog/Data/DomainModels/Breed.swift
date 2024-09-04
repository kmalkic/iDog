//
//  Breed.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct Breed: Decodable {
    
    let id: String
}

extension Breed {
    
    var path: String {
        id
    }
    
    var displayName: String {
        id.components(separatedBy: "-")
            .map { $0.capitalized }
            .joined(separator: " ")
    }
}

