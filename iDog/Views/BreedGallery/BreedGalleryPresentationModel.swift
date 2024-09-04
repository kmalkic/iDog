//
//  BreedGalleryPresentationModel.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

struct BreedGalleryPresentationModel {
    
    let title: String
    var leftColumn: [DogPresentationModel]
    var rightColumn: [DogPresentationModel]
    var error: Error?
}

extension BreedGalleryPresentationModel {
    
    static func new(title: String) -> Self {
        
        BreedGalleryPresentationModel(title: title, leftColumn: [], rightColumn: [], error: nil)
    }
}
