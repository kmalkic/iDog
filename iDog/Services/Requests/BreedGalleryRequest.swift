//
//  BreedGalleryRequest.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

struct BreedGalleryRequest: APIRequest {
    
    let baseURL: URL
    let breedId: String
    let count: UInt
    
    init(
        baseURL: String = BreedProviderConfiguration.default.baseURL,
        breedId: String,
        count: UInt = 10
    ) {
        self.baseURL = URL(string: baseURL)!
        self.breedId = breedId
        self.count = count
    }
    
    var path: String {
        "breed/\(breedId)/images/random/\(count)"
    }
    
    var method: HTTPMethod {
        .get
    }
}
