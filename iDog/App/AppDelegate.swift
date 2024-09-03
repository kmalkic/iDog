//
//  AppDelegate.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import UIKit
import SwiftUI

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: CoordinatorProtocol?
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        // create a basic UIWindow and activate it
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let appCoordinator = AppCoordinator(
            window: window
        )
        self.coordinator = appCoordinator
        appCoordinator.start()
    
        window.makeKeyAndVisible()
        
        return true
    }
}
