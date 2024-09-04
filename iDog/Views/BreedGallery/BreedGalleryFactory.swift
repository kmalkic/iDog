//
//  BreedGalleryFactory.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

enum BreedGalleryFactory {
    
    static func makeView(for breedId: String) -> some View {

        let request = BreedGalleryRequest(breedId: breedId)
        let sharedViewModel = Shared(value: BreedGalleryViewModel.new(with: breedId.capitalized))
        let presenter = BreedGalleryPresenter(
            sharedViewModel: sharedViewModel,
            breedGalleryProvider: BreedGalleryProvider(request: request)
        )
        return BreedGalleryView(
            viewModel: sharedViewModel,
            presenter: presenter
        )
    }
}
