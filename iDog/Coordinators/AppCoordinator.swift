//
//  AppCoordinator.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation
import UIKit
import SwiftUI

class AppCoordinator: CoordinatorProtocol {
    
    private let navigationController: UINavigationController

    var childCoordinators: [CoordinatorProtocol] = []
    private weak var presentedRoot: UIViewController?

    init(
        window: UIWindow
    ) {
        let rootNavigationController = UINavigationController()
        self.navigationController = rootNavigationController
        window.rootViewController = rootNavigationController
    }

    func start() {
        displayBreeds()
    }
    
    private func displayBreeds() {
        let breedListCoordinator = BreedListCoordinator(
            navigationController: navigationController
        )
        childCoordinators.append(breedListCoordinator)
        breedListCoordinator.start()
    }
}
