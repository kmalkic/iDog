//
//  BreedPresentationModel.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct BreedPresentationModel: Identifiable {
    
    let id: String
    let displayName: String
}

extension BreedPresentationModel {
    
    init(_ breed: Breed) {
        
        self.id = breed.id
        self.displayName = breed.displayName
    }
}
