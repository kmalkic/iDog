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
    
    private let sharedViewModel: Shared<BreedGalleryViewModel>
    private let breedGalleryProvider: BreedGalleryProvidable
    
    init(
        sharedViewModel: Shared<BreedGalleryViewModel>,
        breedGalleryProvider: BreedGalleryProvidable
    ) {
        self.sharedViewModel = sharedViewModel
        self.breedGalleryProvider = breedGalleryProvider
    }
    
    @MainActor
    private func updateData(_ dogs: [DogViewModel]) async {
        
        var viewModel = sharedViewModel.value
        let split = dogs.splitByEvenOddIndices()
        viewModel.leftColumn = split.0
        viewModel.rightColumn = split.1
        sharedViewModel.value = viewModel
    }
    
    @MainActor
    private func updateError(_ error: Error) async {
        
        var viewModel = sharedViewModel.value
        viewModel.error = error
        sharedViewModel.value = viewModel
    }
}

extension BreedGalleryPresenter: BreedGalleryPresentable {
    
    func fetch() async {
        
        do {
            let dogs = try await breedGalleryProvider.fetch()
            await updateData(dogs.map(DogViewModel.init))
        }
        catch {
            await updateError(error)
        }
    }
}
