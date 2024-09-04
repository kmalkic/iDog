//
//  DogResponse.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

struct DogResponse: Decodable {
    
    let dogs: [Dog]
    let status: Status
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let status = try container.decode(Status.self, forKey: .status)
        if status == .error {
            throw URLError(.badServerResponse)
        }
        self.status = status
        let message = try container.decode([String].self, forKey: .message)
        self.dogs = message.map { .init(url: $0) }
    }

    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
}
