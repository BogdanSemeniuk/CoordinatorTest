//
//  AuthenticationCoordinator.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    var children = [Coordinator]()
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func show(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = LoginViewController.make()
        viewController.coordinatorDelegate = self
        router.show(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension AuthenticationCoordinator: LoginCoordinatorDelegate {
    func showOnboardingViewController(navigationController: UINavigationController?) {
        guard let navigationController = navigationController else { return }
        let router = OnboardingRouter(navigationController: navigationController)
        let coordinator = OnboardingCoordinator(router: router)
        showChild(coordinator, animated: true)
    }
    
    func showCreateAccountViewController() {
        let viewController = CreateAccountViewController.make()
        viewController.coordinatorDelegate = self
        router.show(viewController, animated: true)
    }
}

extension AuthenticationCoordinator: CreateAccountCoordinatorDelegate {
    func backToLoginViewController() {
        router.hide(animated: true)
    }
}
