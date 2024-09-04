//
//  BreedCell.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

struct BreedCell: View {
    
    struct Style {
        var width: CGFloat = 16
        var height: CGFloat = 16
        var padding: CGFloat = 16
        var verticalPadding: CGFloat = 8
        var color: Color = .red
    }
    
    let presentationModel: BreedPresentationModel
    let action: (String) -> Void
    var style: Style = .init()
    
    var body: some View {
        Button(action: {
            action(presentationModel.id)
        }, label: {
            HStack {
                Text(verbatim: presentationModel.displayName)
                    .font(.custom("Bodoni 72", size: 28))
                    .foregroundColor(style.color)
                    .padding(.leading, style.padding)
                
                Spacer()
                
                Image(systemName: "arrow.up.right")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(style.color)
                    .frame(width: style.width, height: style.height)
                    .padding(.trailing, style.padding)
                    
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, style.verticalPadding)
        })
    }
}
