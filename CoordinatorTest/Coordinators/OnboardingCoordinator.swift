//
//  OnboardingCoordinator.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    var children = [Coordinator]()
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func show(animated: Bool, onDismissed: (() -> Void)?) {
        let vc = Onboarding1ViewController.make()
        vc.coordinatorDelegate = self
        router.show(vc, animated: true, onDismissed: onDismissed)
    }
}

extension OnboardingCoordinator: OnboardingCoordinatorDelegate {
    func goToNexOnboardingViewController(after viewController: UIViewController) {
        if let _ = viewController as? Onboarding1ViewController {
            let vc = Onboarding2ViewController.make()
            vc.coordinatorDelegate = self
            router.show(vc, animated: true)
        } else if let  _ = viewController as? Onboarding2ViewController {
            let vc = Onboarding3ViewController.make()
            vc.coordinatorDelegate = self
            router.show(vc, animated: true)
        }
    }
}

extension OnboardingCoordinator: OnboardingFinishCoordinatorDelegate {
    func finishOnboarding(navigationController: UINavigationController?) {
        guard let navigationController = navigationController else { return }
        let router = MoviesRouter(navigationController: navigationController, window: nil)
        let coordinator = MoviesCoordinator(router: router)
        showChild(coordinator, animated: true)
    }
}

