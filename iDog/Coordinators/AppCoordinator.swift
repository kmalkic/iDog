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
        setupStyles()
        displayBreeds()
    }
    
    private func setupStyles() {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Bodoni 72", size: 32)!,
            .foregroundColor: UIColor.black
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    private func displayBreeds() {
        let breedListCoordinator = BreedListCoordinator(
            navigationController: navigationController
        )
        childCoordinators.append(breedListCoordinator)
        breedListCoordinator.start()
    }
}
