//
//  BreedViewModel.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct BreedViewModel: Identifiable {
    
    let id: String
    let displayName: String
}

extension BreedViewModel {
    
    init(_ breed: Breed) {
        
        self.id = breed.id
        self.displayName = id
            .components(separatedBy: "-")
            .map { $0.capitalized }
            .joined(separator: " ")
    }
}
