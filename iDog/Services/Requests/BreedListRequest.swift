//
//  BreedListRequest.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedListRequest: APIRequest {
    
    let baseURL: URL
    
    init(baseURL: String = BreedProviderConfiguration.default.baseURL) {
        self.baseURL = URL(string: baseURL)!
    }
    
    var path: String {
        "breeds/list/all"
    }
    
    var method: HTTPMethod {
        .get
    }
}
