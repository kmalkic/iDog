//
//  BreedGalleryView.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

struct BreedGalleryView {
    
    @ObservedObject var presentationModel: Shared<BreedGalleryPresentationModel>
    let presenter: BreedGalleryPresentable
    
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

extension BreedGalleryView: View {
    
    var body: some View {
        content
            .navigationTitle(presentationModel.value.title)
            .background(Color.white)
            .task {
                await safeFetch()
            }
    }
    
    @ViewBuilder
    private var content: some View {
        if let error = presentationModel.value.error {
            errorView(error)
        } else if presentationModel.value.leftColumn.isEmpty, presentationModel.value.rightColumn.isEmpty {
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
            HStack(alignment: .top) {
                left
                right
            }
        }
    }
    
    private var left: some View {
        LazyVStack {
            ForEach(presentationModel.value.leftColumn) { dog in
                AsyncDogView(imageURL: dog.url)
            }
        }
        .padding(.top, 30) // just to give an offset to not look aligned on top
    }
    
    private var right: some View {
        LazyVStack {
            ForEach(presentationModel.value.rightColumn) { dog in
                AsyncDogView(imageURL: dog.url)
            }
        }
    }
}

#Preview {
    BreedGalleryFactory.makeView(for: .init(id: "hound", displayName: "Hound"))
}
