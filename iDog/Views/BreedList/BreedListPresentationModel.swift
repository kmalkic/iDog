//
//  BreedListPresentationModel.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedListPresentationModel {
    
    var breeds: [BreedPresentationModel]
    var error: Error?
}

extension BreedListPresentationModel {
    
    static let new = BreedListPresentationModel(breeds: [], error: nil)
}
