//
//  UINavigationController + Extensions.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import UIKit
import SwiftUI

extension UINavigationController {

  open override func viewWillLayoutSubviews() {
      
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
