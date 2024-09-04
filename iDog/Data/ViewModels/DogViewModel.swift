//
//  DogViewModel.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import SwiftUI

struct DogViewModel: Identifiable {
    
    var id: String {
        url?.lastPathComponent ?? UUID().uuidString
    }
    let url: URL?
}

extension DogViewModel {
    
    init(_ dog: Dog) {
        
        self.url = URL(string: dog.url)
    }
}
