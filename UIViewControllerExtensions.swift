//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Ramon Geronimo on 11/18/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
