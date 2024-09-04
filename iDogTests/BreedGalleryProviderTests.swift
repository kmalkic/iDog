//
//  BreedGalleryProviderTests.swift
//  iDogTests
//
//  Created by Kevin Malkic on 04/09/2024.
//

import XCTest
@testable import iDog

final class BreedGalleryProviderTests: XCTestCase {
 
    func testGalleryWhenSuccessfull() async {
        
        let request = BreedGalleryRequestMock(filename: "breeds_gallery")
        let provider = BreedGalleryProvider(request: request)
        do {
            let breeds = try await provider.fetch()
            XCTAssertNotEqual(breeds.count, 0)
        }
        catch {
            XCTFail(request.path)
        }
    }
    
    func testGalleryWhenError() async {
        
        let request = BreedGalleryRequestMock(filename: "breeds_gallery_error")
        let provider = BreedGalleryProvider(request: request)
        do {
            let breeds = try await provider.fetch()
            XCTAssertNotEqual(breeds.count, 0)
        } catch {
            if let error = error as? URLError {
                XCTAssertEqual(error.errorCode, URLError(.badServerResponse).errorCode)
            }
            else {
                XCTFail()
            }
        }
    }
    
    func testGalleryWhen404() async {
        
        let request = BreedGalleryRequestMock(filename: "breeds_gallery_bad_url")
        let provider = BreedGalleryProvider(request: request)
        do {
            let breeds = try await provider.fetch()
            XCTAssertNotEqual(breeds.count, 0)
        } catch {
            if let error = error as? URLError {
                XCTAssertEqual(error.errorCode, URLError(.badServerResponse).errorCode)
            }
            else {
                XCTFail()
            }
        }
    }
    
    func testGalleryWhenCorrupted() async {
        
        let request = BreedGalleryRequestMock(filename: "breeds_gallery_corrupted")
        let provider = BreedGalleryProvider(request: request)
        do {
            let breeds = try await provider.fetch()
            XCTAssertNotEqual(breeds.count, 0)
        } catch {
            if let error = error as? DecodingError {
                switch error {
                case .dataCorrupted:
                    XCTAssertTrue(true)
                default:
                    XCTFail(error.localizedDescription)
                }
            }
            else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
