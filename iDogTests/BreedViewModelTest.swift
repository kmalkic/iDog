//
//  BreedViewModelTest.swift
//  iDogTests
//
//  Created by Kevin Malkic on 03/09/2024.
//

import XCTest
@testable import iDog

final class BreedViewModelTest: XCTestCase {

    func testDisplayNameFormatting() throws {

        let breeds: [Breed] = [
            .init(id: "affenpinscher"),
            .init(id: "bakharwal"),
            .init(id: "australian-shepherd")
        ]
        let viewModels = breeds.map(BreedViewModel.init)
        
        XCTAssertEqual(viewModels[0].displayName, "Affenpinscher")
        XCTAssertEqual(viewModels[1].displayName, "Bakharwal")
        XCTAssertEqual(viewModels[2].displayName, "Australian Shepherd")
    }
}
