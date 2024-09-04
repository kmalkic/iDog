//
//  BreedListView.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct BreedListView {
    
    @ObservedObject var presentationModel: Shared<BreedListPresentationModel>
    let presenter: BreedListPresentable
    
    @State private var isFetching = false // New state to track the fetch status
    
    // Method to safely fetch data and prevent race conditions
    private func safeFetch() async {
        // Avoid triggering multiple fetches simultaneously
        guard !isFetching else { return }
        isFetching = true
        defer { isFetching = false } // Ensure the state is reset after fetch
        
        await presenter.fetch()
    }
}

extension BreedListView: View {
    
    var body: some View {
        content
            .navigationTitle("iDog")
            .task {
                await presenter.fetch()
            }
    }
    
    @ViewBuilder
    private var content: some View {
        if let error = presentationModel.value.error {
            errorView(error)
        } else if presentationModel.value.breeds.isEmpty {
            progress
        } else {
            list
        }
    }
    
    private func errorView(_ error: Error) -> some View {
        Text(verbatim: "Something went wrong. Please try again later.")
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
        ForEach(presentationModel.value.breeds) { breed in
            BreedCell(presentationModel: breed, action: presenter.breedSelected)
        }
    }
}

#Preview {
    BreedListFactory.makeView(routingDelegate: nil)
}
