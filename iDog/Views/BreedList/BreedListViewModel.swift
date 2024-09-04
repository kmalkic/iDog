//
//  BreedListViewModel.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedListViewModel {
    
    var breeds: [BreedViewModel]
    var error: Error?
}

extension BreedListViewModel {
    
    static let new = BreedListViewModel(breeds: [], error: nil)
}
