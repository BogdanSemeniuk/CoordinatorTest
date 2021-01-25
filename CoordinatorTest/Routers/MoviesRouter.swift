//
//  MoviesRouter.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import UIKit

class MoviesRouter: NSObject, Router {
    private var window: UIWindow?
    private let navigationController: UINavigationController
    private var onDismissForViewController = [UIViewController: (() -> Void)]()
    
    public init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        super.init()
        navigationController.delegate = self
    }
    
    public func show(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        if viewController.isKind(of: MoviesListViewController.self) && window != nil  {
            navigationController.viewControllers = [viewController]
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } else if viewController.isKind(of: MoviesListViewController.self) && window == nil   {
            navigationController.viewControllers = [viewController]
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    public func hide(animated: Bool) {
        performOnDismissed(for: navigationController.viewControllers.last!)
        navigationController.popViewController(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

// MARK: - UINavigationControllerDelegate
extension MoviesRouter: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(dismissedViewController) else { return }
        performOnDismissed(for: dismissedViewController)
    }
}
