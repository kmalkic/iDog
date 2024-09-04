//
//  BreedGalleryView.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

struct BreedGalleryView: View {
    
    @ObservedObject var viewModel: Shared<BreedGalleryViewModel>
    let presenter: BreedGalleryPresentable
    
    var body: some View {
        content
            .navigationTitle(viewModel.value.title)
            .background(Color.black)
            .task {
                await presenter.fetch()
            }
    }
    
    @ViewBuilder
    private var content: some View {
        if let error = viewModel.value.error {
            errorView(error)
        } else if viewModel.value.leftColumn.isEmpty, viewModel.value.rightColumn.isEmpty {
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
            HStack(alignment: .top) {
                left
                right
            }
        }
    }
    
    private var left: some View {
        LazyVStack {
            ForEach(viewModel.value.leftColumn) { dog in
                AsyncDogView(imageURL: dog.url)
            }
        }
        .padding(.top, 30) // just to give an offset to not look aligned on top
    }
    
    private var right: some View {
        LazyVStack {
            ForEach(viewModel.value.rightColumn) { dog in
                AsyncDogView(imageURL: dog.url)
            }
        }
    }
}

#Preview {
    BreedGalleryFactory.makeView(for: "hound")
}
