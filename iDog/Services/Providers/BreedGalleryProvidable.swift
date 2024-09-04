//
//  BreedGalleryProvidable.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

protocol BreedGalleryProvidable {
    
    var request: APIRequest { get }
    func fetch() async throws -> [Dog]
}
