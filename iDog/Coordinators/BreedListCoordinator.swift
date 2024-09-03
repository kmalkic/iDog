//
//  BreedListCoordinator.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import UIKit
import SwiftUI

class BreedListCoordinator: CoordinatorProtocol {

    private weak var navigationController: UINavigationController?
    var childCoordinators: [CoordinatorProtocol] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = UIHostingController(rootView: BreedListFactory.makeView(routingDelegate: self))
        navigationController?.viewControllers = [viewController]
    }
}

extension BreedListCoordinator: BreedListRoutingDelegate {
    
    func routeToBreedPhotos() {
        
    }
}
