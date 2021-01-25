//
//  MoviesListViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol MoviesListCoordinatorDelegate: class {
    func presentAccountViewController(navigationController: UINavigationController?)
    func presentMovieDetailsViewController()
}

class MoviesListViewController: UIViewController {
    
    weak var coordinatorDelegate: MoviesListCoordinatorDelegate?

    @IBAction func accountAction(_ sender: UIButton) {
        coordinatorDelegate?.presentAccountViewController(navigationController: navigationController)
    }
    
    @IBAction func movieDetailsAction(_ sender: UIButton) {
        coordinatorDelegate?.presentMovieDetailsViewController()
    }
}
