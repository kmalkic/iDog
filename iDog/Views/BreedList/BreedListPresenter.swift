//
//  BreedListPresenter.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

protocol BreedListPresentable {
    
    func fetch() async
    func breedSelected(for id: String)
}

protocol BreedListRoutingDelegate: AnyObject {
    
    func routeToBreedPhotos(for breedId: String) -> Void
}

class BreedListPresenter {
    
    private let sharedViewModel: Shared<BreedListViewModel>
    private let breedListProvider: BreedListProvidable
    private weak var routingDelegate: BreedListRoutingDelegate?
    
    init(
        sharedViewModel: Shared<BreedListViewModel>,
        breedListProvider: BreedListProvidable,
        routingDelegate: BreedListRoutingDelegate?
    ) {
        self.sharedViewModel = sharedViewModel
        self.breedListProvider = breedListProvider
        self.routingDelegate = routingDelegate
    }
    
    @MainActor
    private func updateData(_ breeds: [BreedViewModel]) async {
        
        var viewModel = sharedViewModel.value
        viewModel.breeds = breeds.sorted(by: { a, b in a.displayName < b.displayName } )
        sharedViewModel.value = viewModel
    }
    
    @MainActor
    private func updateError(_ error: Error) async {
        
        var viewModel = sharedViewModel.value
        viewModel.error = error
        sharedViewModel.value = viewModel
    }
}

extension BreedListPresenter: BreedListPresentable {
    
    func fetch() async {
        
        do {
            let breeds = try await breedListProvider.fetch()
            await updateData(breeds.map(BreedViewModel.init))
        }
        catch {
            await updateError(error)
        }
    }
    
    func breedSelected(for id: String) {
        
        routingDelegate?.routeToBreedPhotos(for: id)
    }
}
