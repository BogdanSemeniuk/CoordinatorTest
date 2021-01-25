//
//  Router.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol Router: class {
    func show(_ viewController: UIViewController, animated: Bool)
    func show(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?)
    func hide(animated: Bool)
}

extension Router {
    func show(_ viewController: UIViewController, animated: Bool) {
        show(viewController, animated: animated, onDismissed: nil)
    }
}
