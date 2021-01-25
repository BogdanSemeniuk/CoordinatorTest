//
//  AccountRouter.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import UIKit

class AccountRouter: NSObject, Router {
    private let navigationController: UINavigationController
    private var onDismissForViewController = [UIViewController: (() -> Void)]()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        navigationController.delegate = self
    }
    
    func show(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func hide(animated: Bool) {
        performOnDismissed(for: navigationController.viewControllers.last!)
        navigationController.popViewController(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension AccountRouter: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(dismissedViewController) else { return }
        performOnDismissed(for: dismissedViewController)
    }
}
