//
//  BreedListView.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct BreedListView: View {
    
    @ObservedObject var viewModel: Shared<BreedListViewModel>
    let presenter: BreedListPresentable
    
    var body: some View {
        content
            .task {
                await presenter.fetch()
            }
            .navigationTitle("iDog")
    }
    
    @ViewBuilder
    private var content: some View {
        if let error = viewModel.value.error {
            errorView(error)
        } else if viewModel.value.breeds.isEmpty {
            progress
        } else {
            list
        }
    }
    
    private func errorView(_ error: Error) -> some View {
        Text(verbatim: error.localizedDescription)
    }
    
    private var progress: some View {
        ProgressView()
    }
    
    private var list: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                cells
            }
        }
    }
    
    private var cells: some View {
        ForEach(viewModel.value.breeds) { breed in
            BreedCell(viewModel: breed, action: presenter.breedSelected)
        }
    }
}

#Preview {
    BreedListFactory.makeView(routingDelegate: nil)
}
