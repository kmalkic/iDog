//
//  BreedGalleryViewModel.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

struct BreedGalleryViewModel {
    
    let title: String
    var leftColumn: [DogViewModel]
    var rightColumn: [DogViewModel]
    var error: Error?
}

extension BreedGalleryViewModel {
    
    static func new(with title: String) -> Self {
        
        BreedGalleryViewModel(title: title, leftColumn: [], rightColumn: [], error: nil)
    }
}
