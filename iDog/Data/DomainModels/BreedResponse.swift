//
//  BreedResponse.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

struct BreedResponse: Decodable {
    
    let breeds: [Breed]
    let status: Status
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let status = try container.decode(Status.self, forKey: .status)
        if status == .error {
            throw BreedAPIError.badResponse(.error)
        }
        self.status = status
        let message = try container.decode([String: [String]].self, forKey: .message)
        self.breeds = message.keys.map { .init(id: $0) }
    }

    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
}
