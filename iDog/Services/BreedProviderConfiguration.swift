//
//  BreedProviderConfiguration.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedProviderConfiguration: ProviderConfiguration {
    
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
}

extension BreedProviderConfiguration {
    
    static let `default` = BreedProviderConfiguration(baseURL: "https://dog.ceo/api/")
}
