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
        let sharedViewModel = Shared(value: BreedListViewModel.new)
        let presenter = BreedListPresenter(
            sharedViewModel: sharedViewModel,
            breedListProvider: BreedListProvider(request: request),
            routingDelegate: routingDelegate
        )
        return BreedListView(
            viewModel: sharedViewModel,
            presenter: presenter
        )
    }
}
