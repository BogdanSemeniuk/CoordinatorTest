//
//  MoviesCoordinator.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import UIKit

class MoviesCoordinator: Coordinator {
    var children = [Coordinator]()
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func show(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = MoviesListViewController.make()
        viewController.coordinatorDelegate = self
        router.show(viewController, animated: animated, onDismissed: onDismissed)
    }
}


extension MoviesCoordinator: MoviesListCoordinatorDelegate {
    func presentAccountViewController(navigationController: UINavigationController?) {
        guard let navigationController = navigationController else { return }
        let router = AccountRouter(navigationController: navigationController)
        let coordinator = AccountCoordinator(router: router)
        showChild(coordinator, animated: true)
    }
    
    func presentMovieDetailsViewController() {
        let viewController = MovieDetailsViewController.make()
        viewController.coordinatorDelegate = self
        router.show(viewController, animated: true)
    }
}


extension MoviesCoordinator: MovieDetailsCoordinatorDelegate {
    func backToMovies() {
        router.hide(animated: true)
    }
}
