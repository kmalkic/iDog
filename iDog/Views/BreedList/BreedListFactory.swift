//
//  BreedListFactory.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

enum BreedListFactory {
    
    static func makeView(
        routingDelegate: BreedListRoutingDelegate?
    ) -> some View {

        let request = BreedListRequest()
        let sharedPresentationModel = Shared(value: BreedListPresentationModel.new)
        let presenter = BreedListPresenter(
            sharedPresentationModel: sharedPresentationModel,
            breedListProvider: BreedListProvider(request: request),
            routingDelegate: routingDelegate
        )
        return BreedListView(
            presentationModel: sharedPresentationModel,
            presenter: presenter
        )
    }
}
