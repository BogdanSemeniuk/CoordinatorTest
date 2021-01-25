//
//  AccountCoordinator.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import Foundation

class AccountCoordinator: Coordinator {
    var children = [Coordinator]()
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func show(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = AccountViewController.make()
        viewController.coordinatorDelegate = self
        router.show(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension AccountCoordinator: AccountCoordinatorDelegate {
    func backToMovies() {
        router.hide(animated: true)
    }
}
