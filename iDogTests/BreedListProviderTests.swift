//
//  BreedListProviderTests.swift
//  iDogTests
//
//  Created by Kevin Malkic on 03/09/2024.
//

import XCTest
@testable import iDog

final class BreedListProviderTests: XCTestCase {
    
    func testListWhenSuccessfull() async {
        
        let request = BreedListRequestMock(filename: "breeds")
        let provider = BreedListProvider(request: request)
        do {
            let breeds = try await provider.fetch()
            XCTAssertNotEqual(breeds.count, 0)
        } 
        catch {
            XCTFail(request.path)
        }
    }
    
    func testListWhenError() async {
        
        let request = BreedListRequestMock(filename: "breeds_error")
        let provider = BreedListProvider(request: request)
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
    
    func testListWhen404() async {
        
        let request = BreedListRequestMock(filename: "breeds_bad_url")
        let provider = BreedListProvider(request: request)
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
    
    func testListWhenCorrupted() async {
        
        let request = BreedListRequestMock(filename: "breeds_corrupted")
        let provider = BreedListProvider(request: request)
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


