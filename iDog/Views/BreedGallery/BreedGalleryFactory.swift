//
//  BreedGalleryFactory.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

enum BreedGalleryFactory {
    
    static func makeView(for breed: BreedPresentationModel) -> some View {

        let request = BreedGalleryRequest(breedId: breed.id)
        let sharedPresentationModel = Shared(value: BreedGalleryPresentationModel.new(title: breed.displayName))
        let presenter = BreedGalleryPresenter(
            sharedPresentationModel: sharedPresentationModel,
            breedGalleryProvider: BreedGalleryProvider(request: request)
        )
        return BreedGalleryView(
            presentationModel: sharedPresentationModel,
            presenter: presenter
        )
    }
}
