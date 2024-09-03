//
//  BreedListProvidable.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

protocol BreedListProvidable {
    
    var request: APIRequest { get }
    func fetch() async throws -> [Breed]
}
