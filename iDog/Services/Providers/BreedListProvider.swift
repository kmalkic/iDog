//
//  BreedListProvider.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedListProvider: BreedListProvidable {
    
    let request: APIRequest
    
    init(request: APIRequest) {
        self.request = request
    }
    
    // Async function to fetch breeds
    func fetch() async throws -> [Breed] {
        
        guard let urlRequest = request.urlRequest
        else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        do {
            let breedResponse = try decoder.decode(BreedResponse.self, from: data)
            return breedResponse.breeds
        }
        catch {
            throw error
        }
    }
}
