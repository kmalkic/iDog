//
//  BreedPresentationModelTest.swift
//  iDogTests
//
//  Created by Kevin Malkic on 03/09/2024.
//

import XCTest
@testable import iDog

final class BreedPresentationModelTest: XCTestCase {

    func testDisplayNameFormatting() throws {

        let breeds: [Breed] = [
            .init(id: "affenpinscher"),
            .init(id: "bakharwal"),
            .init(id: "australian-shepherd")
        ]
        let presentationModels = breeds.map(BreedPresentationModel.init)
        
        XCTAssertEqual(presentationModels[0].displayName, "Affenpinscher")
        XCTAssertEqual(presentationModels[1].displayName, "Bakharwal")
        XCTAssertEqual(presentationModels[2].displayName, "Australian Shepherd")
    }
}
