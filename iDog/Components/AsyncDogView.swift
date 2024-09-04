//
//  AsyncImageView.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct AsyncDogView: View {
    
    struct Style {
        let width: CGFloat
        let height: CGFloat
        let cornerRadius: CGFloat
    }
    
    let imageURL: URL?
    var style: Style = .init(width: 50, height: 50, cornerRadius: 10)
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Color.red // Indicates an error with a red color
                    .frame(width: style.width, height: style.height)
                    .cornerRadius(style.cornerRadius)
            } else {
                ProgressView()
                    .frame(width: style.width, height: style.height)
            }
        }
    }
}
