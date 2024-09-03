//
//  Shared.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import SwiftUI

/// Allows us to share any Value type object between different locations. Used heavily in our SwiftUI pages to share a view model between the Presenter and the View.
class Shared<Value>: ObservableObject {
    
    @Published var value: Value

    init(value: Value) {
        self.value = value
    }
}
