//
//  MovieDetailsViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol MovieDetailsCoordinatorDelegate: class {
    func backToMovies()
}

class MovieDetailsViewController: UIViewController {
    
    weak var coordinatorDelegate: MovieDetailsCoordinatorDelegate?
    
    @IBAction func backAction(_ sender: UIButton) {
        coordinatorDelegate?.backToMovies()
    }
}
