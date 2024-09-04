//
//  DogPresentationModel.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

struct DogPresentationModel: Identifiable {
    
    var id: String {
        url.lastPathComponent
    }
    let url: URL
}

extension DogPresentationModel {
    
    init?(_ dog: Dog) {
        
        guard let url = URL(string: dog.url)
        else { return nil }
        
        self.url = url
    }
}
