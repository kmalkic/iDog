//
//  BreedGalleryCoordinator.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import UIKit
import SwiftUI

class BreedGalleryCoordinator: CoordinatorProtocol {

    private weak var navigationController: UINavigationController?
    var childCoordinators: [CoordinatorProtocol] = []

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {}
    
    func loadGallery(for breed: BreedPresentationModel) {
        
        let viewController = UIHostingController(rootView: BreedGalleryFactory.makeView(for: breed))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
