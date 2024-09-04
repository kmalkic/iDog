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
    
    func routeToBreedPhotos(for breed: BreedPresentationModel) -> Void
}

class BreedListPresenter {
    
    private let sharedPresentationModel: Shared<BreedListPresentationModel>
    private let breedListProvider: BreedListProvidable
    private weak var routingDelegate: BreedListRoutingDelegate?
    
    init(
        sharedPresentationModel: Shared<BreedListPresentationModel>,
        breedListProvider: BreedListProvidable,
        routingDelegate: BreedListRoutingDelegate?
    ) {
        self.sharedPresentationModel = sharedPresentationModel
        self.breedListProvider = breedListProvider
        self.routingDelegate = routingDelegate
    }
    
    @MainActor
    private func updateData(_ breeds: [BreedPresentationModel]) async {
        
        var presentationModel = sharedPresentationModel.value
        presentationModel.breeds = breeds.sorted(by: { a, b in a.displayName < b.displayName } )
        sharedPresentationModel.value = presentationModel
    }
    
    @MainActor
    private func updateError(_ error: Error) async {
        
        var presentationModel = sharedPresentationModel.value
        presentationModel.error = error
        sharedPresentationModel.value = presentationModel
    }
}

extension BreedListPresenter: BreedListPresentable {
    
    func fetch() async {
        
        guard sharedPresentationModel.value.breeds.isEmpty 
        else { return }
        
        do {
            let breeds = try await breedListProvider.fetch()
            await updateData(breeds.map(BreedPresentationModel.init))
        }
        catch {
            await updateError(error)
        }
    }
    
    func breedSelected(for id: String) {
        
        let breeds = sharedPresentationModel.value.breeds
        guard let breed = breeds.first(where: { $0.id == id })
        else { return }
        
        routingDelegate?.routeToBreedPhotos(for: breed)
    }
}
