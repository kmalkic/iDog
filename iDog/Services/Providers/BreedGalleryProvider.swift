//
//  BreedGalleryProvider.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

struct BreedGalleryProvider: BreedGalleryProvidable {
    
    let request: APIRequest
    
    init(request: APIRequest) {
        self.request = request
    }
    
    // Async function to fetch dogs photos
    func fetch() async throws -> [Dog] {
        
        guard let urlRequest = request.urlRequest
        else {
            throw URLError(.badURL)
        }

        // Check for cancellation before starting the request
        if Task.isCancelled {
            throw CancellationError()
        }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        // Check again for cancellation after network call
        if Task.isCancelled {
            throw CancellationError()
        }
        
        let decoder = JSONDecoder()
        do {
            let breedResponse = try decoder.decode(DogResponse.self, from: data)
            return breedResponse.dogs
        }
        catch {
            throw error
        }
    }
}
