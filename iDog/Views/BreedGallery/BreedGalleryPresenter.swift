//
//  BreedGalleryPresenter.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

protocol BreedGalleryPresentable {
    
    func fetch() async
}

class BreedGalleryPresenter {
    
    private let sharedPresentationModel: Shared<BreedGalleryPresentationModel>
    private let breedGalleryProvider: BreedGalleryProvidable
    
    init(
        sharedPresentationModel: Shared<BreedGalleryPresentationModel>,
        breedGalleryProvider: BreedGalleryProvidable
    ) {
        self.sharedPresentationModel = sharedPresentationModel
        self.breedGalleryProvider = breedGalleryProvider
    }
    
    @MainActor
    private func updateData(_ dogs: [DogPresentationModel]) async {
        
        var presentationModel = sharedPresentationModel.value
        let split = dogs.splitByEvenOddIndices()
        presentationModel.leftColumn = split.0
        presentationModel.rightColumn = split.1
        sharedPresentationModel.value = presentationModel
    }
    
    @MainActor
    private func updateError(_ error: Error) async {
        
        var presentationModel = sharedPresentationModel.value
        presentationModel.error = error
        sharedPresentationModel.value = presentationModel
    }
}

extension BreedGalleryPresenter: BreedGalleryPresentable {
    
    func fetch() async {
        
        guard sharedPresentationModel.value.leftColumn.isEmpty
        else { return }
        
        do {
            let dogs = try await breedGalleryProvider.fetch()
            await updateData(dogs.compactMap(DogPresentationModel.init))
        }
        catch {
            await updateError(error)
        }
    }
}
