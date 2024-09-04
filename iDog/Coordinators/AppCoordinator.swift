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
            .font: UIFont(name: "Bodoni 72", size: 30)!,
            .foregroundColor: UIColor.black
        ]
        
        UINavigationBar.appearance().tintColor = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = attributes
        // Configure the background to be translucent
        appearance.configureWithDefaultBackground()
        
        // Apply the appearance to all states of the navigation bar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func displayBreeds() {
        let breedListCoordinator = BreedListCoordinator(
            navigationController: navigationController
        )
        childCoordinators.append(breedListCoordinator)
        breedListCoordinator.start()
    }
}
