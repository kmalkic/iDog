//
//  BreedAPIError.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

enum BreedAPIError: Error {
    case badResponse(Status)
}
