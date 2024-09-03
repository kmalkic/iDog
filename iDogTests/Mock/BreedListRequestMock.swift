//
//  BreedListRequestMock.swift
//  iDogTests
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation
@testable import iDog

struct BreedListRequestMock: APIRequest {
    
    let baseURL: URL
    
    init(filename: String) {
        self.baseURL = Bundle(for: BreedListProviderTests.self)
            .url(forResource: filename, withExtension: "json")!
    }
    
    var urlRequest: URLRequest? {
        URLRequest(url: baseURL)
    }
    
    var path: String {
        ""
    }
    
    var method: HTTPMethod {
        .get
    }
}
