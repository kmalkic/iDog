//
//  CoordinatorProtocol.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    
    var childCoordinators: [CoordinatorProtocol] { get set }
    
    func start()
}
